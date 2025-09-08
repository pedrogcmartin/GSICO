import argparse
import pandas as pd
import numpy as np
import warnings
from pyntcloud import PyntCloud
warnings.simplefilter(action="ignore", category=FutureWarning)
import os
from skimage.color import yuv2rgb


def load_gs_file(file_path):
    print(f"Loading GS file: {file_path}")
    gaussians = PyntCloud.from_file(file_path).points.to_numpy()
    return gaussians

def save_gs_file(gaussians, file_path):    
    output_path = f"{file_path}/rgb"
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    
    print(f"Saving GS file: {output_path}/point_cloud.ply")
    df = PyntCloud(pd.DataFrame(gaussians, columns=['x', 'y', 'z', 'nx', 'ny', 'nz', 'f_dc_0', 'f_dc_1', 'f_dc_2',
       'f_rest_0', 'f_rest_1', 'f_rest_2', 'f_rest_3', 'f_rest_4', 'f_rest_5',
       'f_rest_6', 'f_rest_7', 'f_rest_8', 'f_rest_9', 'f_rest_10',
       'f_rest_11', 'f_rest_12', 'f_rest_13', 'f_rest_14', 'f_rest_15',
       'f_rest_16', 'f_rest_17', 'f_rest_18', 'f_rest_19', 'f_rest_20',
       'f_rest_21', 'f_rest_22', 'f_rest_23', 'f_rest_24', 'f_rest_25',
       'f_rest_26', 'f_rest_27', 'f_rest_28', 'f_rest_29', 'f_rest_30',
       'f_rest_31', 'f_rest_32', 'f_rest_33', 'f_rest_34', 'f_rest_35',
       'f_rest_36', 'f_rest_37', 'f_rest_38', 'f_rest_39', 'f_rest_40',
       'f_rest_41', 'f_rest_42', 'f_rest_43', 'f_rest_44', 'opacity',
       'scale_0', 'scale_1', 'scale_2', 'rot_0', 'rot_1', 'rot_2', 'rot_3']))

    df.to_file(f"{output_path}/point_cloud.ply")

def convertYUV2RGB(gaussians, output_path):
    # Extract YUV SH coefficients
    f_dc = gaussians[:, 6:9]        # Shape: (N, 3)
    f_rest = gaussians[:, 9:54]     # Shape: (N, 45)

    # Reshape f_rest to (N, 15, 3) => 15 SH coeffs per channel
    f_rest = f_rest.reshape(-1, 15, 3, order='F')  # (N, 15, RGB)

    # Convert DC components
    f_dc_rgb = yuv2rgb(f_dc)  # (N, 3)

    # Convert SH coefficients for each coefficient across all Gaussians
    f_rest_rgb= np.zeros_like(f_rest)
    for i in range(15):
        f_rest_rgb[:, i, :] = yuv2rgb(f_rest[:, i, :])

    # Flatten back to (N, 45)
    f_rest_rgb = f_rest_rgb.reshape(-1, 45, order='F')

    # Update gaussians with new RGB values
    gaussians[:, 6:9] = f_dc_rgb
    gaussians[:, 9:54] = f_rest_rgb

    # Save updated file
    save_gs_file(gaussians, output_path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert the color space from the Gausssians spherical harmonics to YUV.")
    parser.add_argument("input_path", type=str, help="Path to the GS file (.ply format)")
    parser.add_argument("output_path", type=str, help="Path to save the output GS file (folder format)")

    args = parser.parse_args()

    gaussians = load_gs_file(args.input_path)
    convertYUV2RGB(gaussians, args.output_path)

    print("Conversion complete.")