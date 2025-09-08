from compression.codec_scaffold import Codec
import numpy as np
import cv2
import os
import pandas as pd
import matplotlib.pyplot as plt

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

class PNGCodec_scaffold(Codec):

    def encode_image(self, image, attr_config, out_file, dtype):
        num_channels = image.shape[-1]
        attr_name = attr_config['name']
        print(f"Encoding {attr_name} now.")

        min_val = image.min()
        max_val = image.max()
        
        write_to_csv(os.path.dirname(out_file), attr_name, min_val, max_val)

        if num_channels == 1:
            quantization = attr_config["quantize"]
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
        
        else:
            for i in range(num_channels):
                channel_img = image[:, :, i]

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

    def decode_image(self, file_name, attr_config):
        base, ext = os.path.splitext(file_name)

        attr_name = attr_config['name']
        print(f"Decoding {attr_name} now.")

        if attr_name in ["_xyz", "_features_offset", "_features_anchor", "_scaling", "_rotation"]:
            channels = []
            i = 0
            while True:
                component_file = f"{base}_{i}.png"
                if not os.path.exists(component_file):
                    break

                img = cv2.imread(component_file, cv2.IMREAD_UNCHANGED | cv2.IMREAD_ANYDEPTH | cv2.IMREAD_ANYCOLOR)
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
            # Normal single-image decoding
            if not os.path.exists(file_name):
                raise FileNotFoundError(f"File not found: {file_name}")

            img = cv2.imread(file_name, cv2.IMREAD_UNCHANGED | cv2.IMREAD_ANYDEPTH | cv2.IMREAD_ANYCOLOR)
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