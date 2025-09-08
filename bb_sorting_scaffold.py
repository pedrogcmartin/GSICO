import argparse
import numpy as np
from pyntcloud import PyntCloud
from tqdm import tqdm
import warnings
import os
from sklearn.cluster import KMeans
import time
from compression.png_scaffold import PNGCodec_scaffold
from PIL import Image
import pandas as pd
import yaml
import json
import math

warnings.simplefilter(action="ignore", category=FutureWarning)

codecs = {
    "png": PNGCodec_scaffold,
}

def load_gs_file(file_path):
    print(f"Loading GS file: {file_path}")
    gaussians = PyntCloud.from_file(file_path).points.to_numpy()
    return gaussians

def save_gs_file(gaussians, file_path, exp):
    print(f"Saving reordered GS file: {file_path}/{exp}/point_cloud.ply")
    df = PyntCloud(pd.DataFrame(gaussians, columns=['x', 'y', 'z', 'nx', 'ny', 'nz', 'f_offset_0', 'f_offset_1',
       'f_offset_2', 'f_offset_3', 'f_offset_4', 'f_offset_5', 'f_offset_6',
       'f_offset_7', 'f_offset_8', 'f_offset_9', 'f_offset_10', 'f_offset_11',
       'f_offset_12', 'f_offset_13', 'f_offset_14', 'f_offset_15',
       'f_offset_16', 'f_offset_17', 'f_offset_18', 'f_offset_19',
       'f_offset_20', 'f_offset_21', 'f_offset_22', 'f_offset_23',
       'f_offset_24', 'f_offset_25', 'f_offset_26', 'f_offset_27',
       'f_offset_28', 'f_offset_29', 'f_anchor_feat_0', 'f_anchor_feat_1',
       'f_anchor_feat_2', 'f_anchor_feat_3', 'f_anchor_feat_4',
       'f_anchor_feat_5', 'f_anchor_feat_6', 'f_anchor_feat_7',
       'f_anchor_feat_8', 'f_anchor_feat_9', 'f_anchor_feat_10',
       'f_anchor_feat_11', 'f_anchor_feat_12', 'f_anchor_feat_13',
       'f_anchor_feat_14', 'f_anchor_feat_15', 'f_anchor_feat_16',
       'f_anchor_feat_17', 'f_anchor_feat_18', 'f_anchor_feat_19',
       'f_anchor_feat_20', 'f_anchor_feat_21', 'f_anchor_feat_22',
       'f_anchor_feat_23', 'f_anchor_feat_24', 'f_anchor_feat_25',
       'f_anchor_feat_26', 'f_anchor_feat_27', 'f_anchor_feat_28',
       'f_anchor_feat_29', 'f_anchor_feat_30', 'f_anchor_feat_31', 'opacity',
       'scale_0', 'scale_1', 'scale_2', 'scale_3', 'scale_4', 'scale_5',
       'rot_0', 'rot_1', 'rot_2', 'rot_3']))
    df.to_file(f"{file_path}/{exp}/point_cloud.ply")


def normalization(image):
    #print(image.min(), image.max())
    return (image - image.min()) / (image.max() - image.min()) * 256

def load_config(config_path: str):
    with open(config_path, 'r') as stream:
        config = yaml.safe_load(stream)
    return config

def log_transform(coords):
    positive = coords > 0
    negative = coords < 0
    zero = coords == 0

    transformed_coords = np.zeros_like(coords)
    transformed_coords[positive] = np.log1p(coords[positive])
    transformed_coords[negative] = -np.log1p(-coords[negative])
    # For zero, no change is needed as transformed_coords is already initialized to zeros

    return transformed_coords

def save_gaussian_images(images, file_path, compression_config):
    compr_exp_config = load_config(compression_config)
    experiment = compr_exp_config['experiments'][0]
    compressed_min_vals = {}
    compressed_max_vals = {}
    compressed_files = {}
    total_size_bytes = 0
    os.makedirs(file_path, exist_ok=True)

    for attribute in experiment['attributes']:
        attr_name = attribute['name']
        attr_method = attribute['method']
        attr_params = attribute.get('params', {})
        
        if not attr_params:
            attr_params = {}
        
        codec = codecs[attr_method]()
        file_name = f"{attr_name}.{codec.file_ending()}"
        out_file = os.path.join(file_path, file_name)

        if attr_name == '_xyz':
            attr_np = images[:, :, :3]

        if attr_name == '_features_offset':
            attr_np = images[:, :, 6:36]

        if attr_name == '_features_anchor':
            attr_np = images[:, :, 36:68]

        if attr_name == '_scaling':
            attr_np = images[:, :, 69:75]

        if attr_name == '_rotation':
            attr_np = images[:, :, 75:]

        if attr_name == '_opacity':
            attr_np = images[:, :, 68:69]
            
        if attribute['contract'] == True:
            print(attr_name, "was contracted.")
            attr_np = log_transform(attr_np)

        if attribute['normalize'] == True:
            print(attr_name, "was normalized.")
            min_val, max_val = codec.encode_with_normalization(attr_np, attr_name, out_file, **attr_params)

        else:
            codec.encode(attr_np, attribute, out_file, **attr_params)
            min_val = max_val = None

        try:
            total_size_bytes += os.path.getsize(os.path.join(file_path, file_name))

        except:
            total_size_bytes += 0

        compressed_files[attr_name] = file_name
        compressed_min_vals[attr_name] = 0
        compressed_max_vals[attr_name] = 0

    compr_info = pd.DataFrame([compressed_min_vals, compressed_max_vals, compressed_files], index=["min", "max", "file"]).T
    compr_info.to_csv(os.path.join(file_path, "compression_info.csv"))

    experiment['max_sh_degree'] = 3
    experiment['active_sh_degree'] = 3
    experiment['disable_xyz_log_activation'] = True
    with open(os.path.join(file_path, "compression_config.yml"), 'w') as stream:
        yaml.dump(experiment, stream)
    
    data = {"Bytes": total_size_bytes}
    with open(os.path.join(file_path, "stats.json"), "w") as f:
        json.dump(data, f, indent=4)
    
    print(f"Images saved at the following folder: {file_path}")


def prune_gaussians(gaussians, n_gaussians_prune):
    print(f"Randomly pruning {n_gaussians_prune} Gaussians...")
    total = len(gaussians)
    
    # Generate random indices to keep
    all_indices = np.arange(total)
    np.random.shuffle(all_indices)
    keep_indices = all_indices[n_gaussians_prune:]
    
    return gaussians[keep_indices]

def create_clusters(gaussians, num_clusters=1024):
    print(f"Clustering {len(gaussians)} Gaussians into {num_clusters} clusters...")
    start_time = time.time()
    kmeans = KMeans(n_clusters=num_clusters, random_state=0, init='k-means++', n_init='auto', max_iter=300)
    features = np.concatenate([gaussians[:, :3], gaussians[:, 36:68]], axis=1)
    cluster_labels = kmeans.fit_predict(features)
    print(f"Elapsed clustering time: {time.time() - start_time:.2f}s")

    # Count number of Gaussians in each cluster
    cluster_sizes = np.bincount(cluster_labels)
    for i, size in enumerate(cluster_sizes):
        print(f"Cluster {i}: {size} points")
    return cluster_labels

def split_into_blocks(gaussians, cluster_labels, block_size):
    block_len = block_size * block_size
    remaining_gaussians = []

    blocks = []
    for label in np.unique(cluster_labels):
        cluster_gaussians = gaussians[cluster_labels == label]
        n_full_blocks = len(cluster_gaussians) // block_len

        for i in range(n_full_blocks):
            block = cluster_gaussians[i * block_len:(i + 1) * block_len]
            blocks.append(block)

        # Save leftover Gaussians
        remainder = cluster_gaussians[n_full_blocks * block_len:]
        if len(remainder) > 0:
            remaining_gaussians.append(remainder)

    if remaining_gaussians:
        remaining_gaussians = np.concatenate(remaining_gaussians, axis=0)
    else:
        remaining_gaussians = np.empty((0, gaussians.shape[1]))

    return blocks, remaining_gaussians

def create_blocks(gaussians, block_size=32):
    all_blocks = []
    remaining = gaussians.copy()
    iteration = 0

    while len(remaining) >= block_size * block_size:
        iteration += 1
        n_possible_blocks = len(remaining) // (block_size * block_size)
        cluster_labels = create_clusters(remaining, num_clusters=n_possible_blocks)
        blocks, remaining = split_into_blocks(remaining, cluster_labels, block_size)
        all_blocks.extend(blocks)
        print(f"Iteration {iteration}: {len(blocks)} blocks created, {len(remaining)} Gaussians remaining.")

    return np.array(all_blocks)

def zigzag_order_indices(w_size, h_size):
    """ Generate zigzag scan indices for a rectangle of size (h_size, w_size). """
    indices = []
    for row in range(h_size):
        if row % 2 == 0:
            # Left to right
            indices.extend([row * w_size + col for col in range(w_size)])
        else:
            # Right to left
            indices.extend([row * w_size + col for col in reversed(range(w_size))])
    return np.array(indices)

def get_neighbors(pixel_idx, assigned_pixels, w_size, h_size):
    row, col = divmod(pixel_idx, w_size)
    neighbors = []    
    size = w_size

    def is_valid_and_assigned(idx):
        """Check if the index is within bounds and has been assigned."""
        return  assigned_pixels[idx] != -1 #and 0 <= idx < len(assigned_pixels) #decomment in case of 2-nd degree search window

    # Top-left neighbor
    top_left = (row - 1) * size + (col - 1)
    if row > 0 and col > 0 and is_valid_and_assigned(top_left):
        neighbors.append(assigned_pixels[top_left])

    # Top-center neighbor
    top_center = (row - 1) * size + col
    if row > 0 and is_valid_and_assigned(top_center):
        neighbors.append(assigned_pixels[top_center])

    # Top-right neighbor
    top_right = (row - 1) * size + (col + 1)
    if row > 0 and col < size - 1 and is_valid_and_assigned(top_right):
        neighbors.append(assigned_pixels[top_right])

    # Left neighbor
    left = row * size + (col - 1)
    if col > 0 and is_valid_and_assigned(left):
        neighbors.append(assigned_pixels[left])
    
    # Right neighbor
    right = row * size + (col + 1)
    if col < size - 1 and is_valid_and_assigned(right):
        neighbors.append(assigned_pixels[right])

    return neighbors

def mean_distance(candidate, assigned_neighbors, gaussians):
    """Computes the mean Euclidean distance between a candidate Gaussian and assigned neighbors."""
    if not assigned_neighbors:
        return float('inf')  # If no neighbors, return max distance
    else:
        return np.sum((np.concatenate([gaussians[assigned_neighbors, :3] - candidate[:3], gaussians[assigned_neighbors, 36:68] - candidate[36:68]], axis=1))**2, axis=1).mean()

def sort_blocks(gaussians, blocks, block_size, num_blocks, w_grid_size, h_grid_size, file_path, compression_config, exp):
    # Compute centroids for each block
    centroids = np.array([np.concatenate([block[:, :3], block[:, 36:68]], axis=1).mean(axis=0) for block in blocks])
    
    # Initialize variables
    sorted_blocks = np.empty_like(blocks) #[None] * num_blocks
    assigned_block_indices = np.full(num_blocks, -1)
    remaining_block_indices = set(range(num_blocks))

    # Define blocks scanning order
    block_order = zigzag_order_indices(w_grid_size, h_grid_size)

    # Assign first block (farthest centroid)
    first_block_idx = np.argmin(np.linalg.norm(centroids - np.median(centroids, axis=0), axis=1))

    sorted_blocks[block_order[0]] = blocks[first_block_idx]
    assigned_block_indices[block_order[0]] = first_block_idx
    remaining_block_indices.remove(first_block_idx)

    # Sort blocks of Gaussians
    for i in tqdm(range(1, num_blocks), desc="Sorting blocks of Gaussians"):
        block_idx = block_order[i]
        assigned_block_neighbors = get_neighbors(block_idx, assigned_block_indices, w_grid_size, h_grid_size)
        best_block_idx = best_block_idx = min(remaining_block_indices, key=lambda idx: np.mean([np.linalg.norm(centroids[idx] - centroids[n_idx]) for n_idx in assigned_block_neighbors])) #min(remaining_block_indices, key=lambda idx: np.sqrt(np.sum((centroids[idx] - assigned_block_neighbors)**2, axis=1)).mean())
        sorted_blocks[block_idx] = blocks[best_block_idx]
        assigned_block_indices[block_idx] = best_block_idx
        remaining_block_indices.remove(best_block_idx)

    start_time = time.time()

    # Initialize variables
    sorted_gaussians = np.zeros((block_size * h_grid_size, block_size * w_grid_size, gaussians.shape[1]), dtype=gaussians.dtype)

    # Define Gaussians scan order within a block
    gaussian_order = zigzag_order_indices(block_size, block_size)

    for block_id in tqdm(range(num_blocks), desc="Sorting Gaussians within blocks"):
        block = sorted_blocks[block_id]
        block_gaussians = np.empty_like(block)
        assigned = np.full(block_size**2, -1)
        remaining = set(range(block_size**2))

        # Pick first Gaussian as farthest one from origin
        first_idx = np.argmin(np.linalg.norm(np.concatenate([block[:, :3], block[:, 36:68]], axis=1) - np.median(np.concatenate([block[:, :3], block[:, 36:68]], axis=1), axis=0), axis=1))
        block_gaussians[gaussian_order[0]] = block[first_idx]
        assigned[gaussian_order[0]] = first_idx
        remaining.remove(first_idx)

        for i in range(1, block_size**2):
            pixel_idx = gaussian_order[i]
            neighbors = get_neighbors(pixel_idx, assigned, block_size, block_size)
            best_idx = min(remaining, key=lambda idx: mean_distance(block[idx], neighbors, block))
            block_gaussians[pixel_idx] = block[best_idx]
            assigned[pixel_idx] = best_idx
            remaining.remove(best_idx)
        
        row = block_id // w_grid_size
        col = block_id % w_grid_size
        start_y = row * block_size
        start_x = col * block_size

        # Reshape block into 2D and place it in the big grid
        sorted_gaussians[start_y:start_y+block_size, start_x:start_x+block_size, :] = block_gaussians.reshape((block_size, block_size, -1))

    print(f"Elapsed sorting time: {time.time() - start_time:.2f}s")

    output_path = f"{file_path}/{exp}"
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Save final sorted Gaussians
    save_gs_file(sorted_gaussians.reshape(-1, sorted_gaussians.shape[2]), file_path, exp)
    save_gaussian_images(sorted_gaussians.reshape(block_size*h_grid_size, block_size*w_grid_size, -1), output_path, compression_config)

def is_prime(n):
    if n % 2 == 0:
        return False

    for i in range(3, int(n**0.5) + 1, 2):
        if n % i == 0:
            return False 

    return True

def compute_grid_size(n):
    for h in range(int(math.isqrt(n)), 0, -1):
        if n % h == 0:
            w = n // h
            return w, h

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Sort Gaussians into 2D blocks using clustering.")
    parser.add_argument("exp", type=str, default="png_quant_sh_ours_lossless_3dgs", help="Experiment tag")
    parser.add_argument("input_path", type=str, help="Path to the GS file (.ply format)")
    parser.add_argument("output_path", type=str, help="Path to save the output GS file (folder format)")
    parser.add_argument("compression_config", type=str)
    parser.add_argument("block_size", type=int)
    args = parser.parse_args()

    start_abs_time = time.time()

    gaussians = load_gs_file(args.input_path)

    # Compute parameters
    block_size = args.block_size

    n_gaussians = len(gaussians)
    n_blocks = int(n_gaussians / (block_size**2))
    
    if is_prime(n_blocks):
        print(f"Wait, the number of blocks it's a prime number... Recalculating to {n_blocks-1} blocks")
        n_blocks -= 1

    w_grid_size, h_grid_size = compute_grid_size(n_blocks)
    n_gaussians_prune = n_gaussians - n_blocks * block_size**2

    print(f"Grid size: {w_grid_size} x {h_grid_size} blocks")

    # Prune Gaussians
    if n_gaussians_prune:
        gaussians = prune_gaussians(gaussians, n_gaussians_prune)

    # Create blocks
    blocks = create_blocks(gaussians, block_size)
    print(f"\nTotal blocks created: {len(blocks)}")

    # Create images
    sort_blocks(gaussians, blocks, block_size, n_blocks, w_grid_size, h_grid_size, args.output_path, args.compression_config, args.exp)
    print(f"Total elapsed time: {time.time() - start_abs_time:.2f}s")