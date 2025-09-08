from __future__ import annotations
import argparse
import os
import shutil
import subprocess
from pathlib import Path
from typing import Iterable, Mapping, Optional


def run(cmd: Iterable[str] | str, env: Optional[Mapping[str, str]] = None, cwd: Optional[Path] = None, shell: bool = False):
    subprocess.run(cmd, env=env, cwd=str(cwd) if cwd else None, check=True, shell=shell)

def ensure_dir(p: Path):
    p.mkdir(parents=True, exist_ok=True)

def safe_copy(src: Path, dst: Path):
    ensure_dir(dst.parent)
    shutil.copy2(src, dst)

def safe_move(src: Path, dst: Path):
    ensure_dir(dst.parent)
    shutil.move(src, dst)


def main():
    parser = argparse.ArgumentParser(description="Python port of the JXL/GS compression pipeline.")
    parser.add_argument("--dataset", default="tandt", help="Dataset name (default: tandt)")
    parser.add_argument("--exp", default="png_quant_sh_ours_lossless_3dgs", help="Experiment tag")
    parser.add_argument("--scene", default="truck", help="Scene list (space-separated)")
    parser.add_argument("--iteration", default="30000", help="Iteration number used in paths (default: 30000)")
    parser.add_argument("--cuda_devices", default="0", help="Value for CUDA_VISIBLE_DEVICES for GPU steps (default: 0)")
    args = parser.parse_args()

    base_out = Path("./output")
    cfg_root = Path("./config")
    iter_dirname = f"iteration_{args.iteration}"

    # Per-call environment for GPU steps
    gpu_env = os.environ.copy()
    gpu_env["CUDA_VISIBLE_DEVICES"] = args.cuda_devices

    scene = args.scene
    print(f"\n==== Processing scene: {scene} ====\n")
    scene_root = base_out / args.dataset / scene

    comp_root = scene_root / "compression"
    exp_root = comp_root / args.exp
    bitstream_root = exp_root / "bitstream"
    decoded_root = bitstream_root / "decoded"
    scene_dir = Path("scene")

    ensure_dir(decoded_root)
    for fname in ("compression_info.csv", "compression_config.yml", "attr_info.csv"):
        safe_copy(bitstream_root / fname, decoded_root / fname)
    
    safe_move(scene_dir / "gaussian_model_scaffold.py", scene_dir / "gaussian_model.py")

    # 1) JPEG XL image decoding
    print("Step 1: JPEG XL image decoding\n")
    run(["bash", "jxl_decoder_scaffold.sh", args.dataset, args.scene, args.exp])
    
    # 2) Gaussian creation
    print("\nStep 2: Reading Gaussians from the decoded images\n")
    run(["python", "-m", "compression.decompress_scaffold", "--compressed_model_path", str(decoded_root)], env=gpu_env)

    safe_move(scene_dir / "gaussian_model.py", scene_dir / "gaussian_model_scaffold.py")


if __name__ == "__main__":
    main()

