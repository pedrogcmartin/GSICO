from abc import ABC

def normalize_img(img, min_val, max_val):
    img = img.clip(min_val, max_val)
    img = (img - min_val) / (max_val - min_val)
    return img

min_thresholds = {
    "_features_dc": -2,
    "_features_rest": -1,
    "_scaling": -16,
    "_rotation": -1,
    "_opacity": -6,
}

max_thresholds = {
    "_features_dc": 4,
    "_features_rest": 1,
    "_scaling": 6,
    "_rotation": 2,
    "_opacity": 12,
}

class Codec(ABC):

    def encode_image(self, image, out_file, **kwargs):
        raise NotImplementedError("Subclasses should implement this!")

    def decode_image(self, file_name):
        raise NotImplementedError("Subclasses should implement this!")

    def file_ending(self):
        raise NotImplementedError("Subclasses should implement this!")

    def normalize_to_thresholds(self, img, attr_name):

        # normalize coordinates to 0...1
        if attr_name == "_xyz":
            xyz_min = img.min()
            xyz_max = img.max()
            return normalize_img(img, xyz_min, xyz_max), xyz_min, xyz_max

        min_val = min_thresholds[attr_name]
        max_val = max_thresholds[attr_name]

        return normalize_img(img, min_val, max_val), min_val, max_val

    def read_file_bytes(self, file_path):
        with open(file_path, "rb") as f:
            return f.read()
    
    def write_file_bytes(self, file_path, bytes):
        with open(file_path, "wb") as f:
            f.write(bytes)

    def encode(self, image, attr_config, out_file, **kwargs):
        self.encode_image(image, attr_config, out_file, **kwargs)

    def decode(self, image, attr_config):
        return self.decode_image(image, attr_config)

    def encode_with_normalization(self, image, attr_config, attr_name, out_file, **kwargs):
        img_norm, min_val, max_val = self.normalize_to_thresholds(image, attr_name)
        self.encode(img_norm, attr_config, out_file, **kwargs)
        return min_val, max_val
    
    def decode_with_normalization(self, file_name, attr_config, min_val, max_val):
        img_norm = self.decode(file_name, attr_config)
        return img_norm * (max_val - min_val) + min_val