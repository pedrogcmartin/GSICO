from compression.codec_3dgs import Codec
import numpy as np
import cv2
import os
import pandas as pd
import matplotlib.pyplot as plt
import warnings
warnings.simplefilter(action="ignore", category=FutureWarning)

def write_to_csv(out_path, attr_name, min_val, max_val):
        csv_file = os.path.join(out_path, "attr_info.csv")

        # Create new dataframe for the current parameter
        new_row = pd.DataFrame([{
            "name": attr_name,
            "min_val": f"{min_val:.16f}",
            "max_val": f"{max_val:.16f}"
        }])

        # If the file exists, load and append
        if os.path.exists(csv_file):
            df = pd.read_csv(csv_file)
            df = pd.concat([df, new_row], ignore_index=True)
        else:
            df = new_row

        # Save updated dataframe back to CSV
        df.to_csv(csv_file, index=False)

def read_from_csv(out_path, attr_name):
    csv_file = os.path.join(out_path, "attr_info.csv")
    
    if not os.path.exists(csv_file):
        raise FileNotFoundError(f"No CSV file found at: {csv_file}")

    df = pd.read_csv(csv_file)

    # Find the row corresponding to the given attribute name
    row = df[df["name"] == attr_name]

    if row.empty:
        raise ValueError(f"Attribute '{attr_name}' not found in CSV.")

    # Convert values back to float
    min_val = np.float32(row["min_val"].values[0])
    max_val = np.float32(row["max_val"].values[0])

    return min_val, max_val

class PNGCodec_3dgs(Codec):

    def encode_image(self, image, attr_config, out_file, dtype):
        num_channels = image.shape[-1]
        attr_name = attr_config['name']
        print(f"Encoding {attr_name} now.")

        # Decide per-channel export for selected attributes
        if attr_name in ["_xyz", "_scaling", "_rotation"]:
            if attr_name == "_xyz":
                min_val = image.min()
                max_val = image.max()
            
            elif attr_name == "_scaling":
                min_val = image.min()
                max_val = image.max()
            
            else:
                min_val = image.min()
                max_val = image.max()

            write_to_csv(os.path.dirname(out_file), attr_name, min_val, max_val)

            for i in range(num_channels):
                channel_img = image[:, :, i]

                if "quantize" in attr_config:
                    quantization = attr_config["quantize"]
                    val_range = max_val - min_val or 1
                    channel_img = (channel_img - min_val) / val_range
                    qpow = 2 ** quantization - 1
                    channel_img = np.round(channel_img * qpow)
                    channel_img = channel_img.astype(np.float32)

                match dtype:
                    case "uint8":
                        channel_img = channel_img.astype("uint8")
                    case "uint16":
                        channel_img = channel_img.astype("uint16")

                out_file_component = out_file.replace(".png", f"_{i}.png")
                cv2.imwrite(out_file_component, channel_img)

        else:
            if num_channels > 4:
                if "quantizeY1" in attr_config:
                    # Global min/max across all channels
                    min_val = image.min()
                    max_val = image.max()

                    write_to_csv(os.path.dirname(out_file), attr_name, min_val, max_val)
                    val_range = max_val - min_val or 1

                    # Define channel groups
                    groups = {
                        "quantizeY1": [0, 3, 6],
                        "quantizeY2": [9, 12, 15, 18, 21],
                        "quantizeY3": [24, 27, 30, 33, 36, 39, 42],
                        "quantizeU1": [1, 4, 7],
                        "quantizeU2": [10, 13, 16, 19, 22],
                        "quantizeU3": [25, 28, 31, 34, 37, 40, 43],
                        "quantizeV1": [2, 5, 8],
                        "quantizeV2": [11, 14, 17, 20, 23],
                        "quantizeV3": [26, 29, 32, 35, 38, 41, 44]
                    }

                    # Apply quantization per group
                    for key, channels in groups.items():
                        if key not in attr_config:
                            continue
                        quantization = attr_config[key]
                        qpow = 2 ** quantization - 1

                        for ch in channels:
                            image[:, :, ch] = (image[:, :, ch] - min_val) / val_range
                            image[:, :, ch] = np.round(image[:, :, ch] * qpow)
                            image[:, :, ch] = image[:, :, ch].astype(np.float32)

                match dtype:
                    case "uint8":
                        image = image.astype("uint8")
                    case "uint16":
                        image = image.astype("uint16")
                
                if num_channels != 45:
                    raise ValueError(f"Unsupported number of channels: {num_channels}. Expected 45.")

                # Split into 15 images with 3 channels each
                h, w, _ = image.shape
                for i in range(15):
                    # Select channels following the requested pattern
                    selected_channels = [i*3, i*3 + 1, i*3 + 2]
                    img_subset = image[:, :, selected_channels]

                    # Construct output filename
                    out_file_subset = out_file.replace(".png", f"_{i+1:02d}.png")
                    cv2.imwrite(out_file_subset, img_subset)

            else:
                if "quantize" in attr_config:
                    quantization = attr_config["quantize"]

                    if attr_name == "_features_dc":
                        min_val = image.min()
                        max_val = image.max()
                    
                    else:
                        min_val = image.min()
                        max_val = image.max()

                    write_to_csv(os.path.dirname(out_file), attr_name, min_val, max_val)
                    val_range = max_val - min_val or 1
                    image = (image - min_val) / val_range
                    qpow = 2 ** quantization - 1
                    image = np.round(image * qpow)
                    image = image.astype(np.float32)

                match dtype:
                    case "uint8":
                        image = image.astype("uint8")
                    case "uint16":
                        image = image.astype("uint16")
                
                cv2.imwrite(out_file, image)

    def decode_image(self, file_name, attr_config):
        base, ext = os.path.splitext(file_name)

        attr_name = attr_config['name']
        print(f"Decoding {attr_name} now.")

        if attr_name in ["_xyz", "_scaling", "_rotation"]:
            channels = []
            i = 0
            while True:
                component_file = f"{base}_{i}.png"
                if not os.path.exists(component_file):
                    break
                img = cv2.imread(component_file, cv2.IMREAD_UNCHANGED | cv2.IMREAD_ANYDEPTH | cv2.IMREAD_ANYCOLOR)

                if "quantize" in attr_config:
                    quantization = attr_config["quantize"]
                    min_val, max_val = read_from_csv(os.path.dirname(file_name), attr_name)
                    val_range = max_val - min_val
                    qpow = 2 ** quantization - 1
                    img = (img / qpow) * val_range + min_val
                    img = img.astype(np.float32)

                channels.append(img[:, :, None])
                i += 1
            img = np.concatenate(channels, axis=2)
            return img

        else:
            if file_name.endswith("_features_rest.png"):
                base_path = file_name.replace("_features_rest.png", "")  # Remove base filename
                images = []

                # Read 15 images (_features_rest_01.png, _features_rest_02.png, ..., _features_rest_15.png)
                for i in range(1, 16):
                    sub_file = f"{base_path}_features_rest_{i:02d}.png"
                    print(f"Reading: {sub_file}")

                    if not os.path.exists(sub_file):
                        raise FileNotFoundError(f"Missing expected file: {sub_file}")

                    img = cv2.imread(sub_file, cv2.IMREAD_UNCHANGED | cv2.IMREAD_ANYDEPTH | cv2.IMREAD_ANYCOLOR)

                    images.append(img)

                # Rearrange the channels in the correct order
                h, w, _ = images[0].shape
                reconstructed_image = np.zeros((h, w, 45), dtype=images[0].dtype)

                for i in range(15):
                    reconstructed_image[:, :, i*3] = images[i][:, :, 0]  # 1st channel of i-th image
                    reconstructed_image[:, :, i*3 + 1] = images[i][:, :, 1]  # 2nd channel of i-th image
                    reconstructed_image[:, :, i*3 + 2] = images[i][:, :, 2]  # 3rd channel of i-th image
                
                if "quantizeY1" in attr_config:
                    # Fixed global min/max for all channels
                    min_val, max_val = read_from_csv(os.path.dirname(file_name), attr_name)
                    reconstructed_image = reconstructed_image.astype(np.float32)
                    val_range = max_val - min_val if max_val != min_val else 1

                    # Define channel groups
                    groups = {
                        "quantizeY1": [0, 3, 6],
                        "quantizeY2": [9, 12, 15, 18, 21],
                        "quantizeY3": [24, 27, 30, 33, 36, 39, 42],
                        "quantizeU1": [1, 4, 7],
                        "quantizeU2": [10, 13, 16, 19, 22],
                        "quantizeU3": [25, 28, 31, 34, 37, 40, 43],
                        "quantizeV1": [2, 5, 8],
                        "quantizeV2": [11, 14, 17, 20, 23],
                        "quantizeV3": [26, 29, 32, 35, 38, 41, 44]
                    }

                    # Apply dequantization per group
                    for key, channels in groups.items():
                        if key not in attr_config:
                            continue
                        quantization = attr_config[key]
                        qpow = 2 ** quantization - 1

                        for ch in channels:
                            reconstructed_image[:, :, ch] = (reconstructed_image[:, :, ch] / qpow) * val_range + min_val
                            reconstructed_image[:, :, ch] = np.nan_to_num(reconstructed_image[:, :, ch], nan=0)

                return reconstructed_image

            else:
                # Normal single-image decoding
                if not os.path.exists(file_name):
                    raise FileNotFoundError(f"File not found: {file_name}")

                img = cv2.imread(file_name, cv2.IMREAD_UNCHANGED | cv2.IMREAD_ANYDEPTH | cv2.IMREAD_ANYCOLOR)

                if "quantize" in attr_config:
                    quantization = attr_config["quantize"]
                    attr_name = attr_config['name']
                    min_val, max_val = read_from_csv(os.path.dirname(file_name), attr_name)
                    val_range = max_val - min_val

                    # no division by zero
                    if val_range == 0:
                        val_range = 1
                    
                    qpow = 2 ** quantization - 1
                    img = (img / qpow) * val_range + min_val
                    img = img.astype(np.float32)
                
                return img

    def file_ending(self):
        return "png"