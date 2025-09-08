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
    parser.add_argument("--block_size", default=16, help="BB sorting algorithm block size")
    parser.add_argument("--q", default=100, help="JPEG XL coding quality (-inf to 100, where 100 is mathematically lossless)")
    parser.add_argument("--e", default=3, help="JPEG XL coding effort (1 to 11)")
    parser.add_argument("--iteration", default="30000", help="Iteration number used in paths (default: 30000)")
    parser.add_argument("--cuda_devices", default="0", help="Value for CUDA_VISIBLE_DEVICES for GPU steps (default: 0)")
    args = parser.parse_args()

    base_out = Path("./output")
    cfg_root = Path("./config")
    iter_dirname = f"iteration_{args.iteration}"

    # Per-call environment for GPU steps
    gpu_env = os.environ.copy()
    gpu_env["CUDA_VISIBLE_DEVICES"] = args.cuda_devices

    print(f"\n==== Processing scene: {args.scene} ====\n")
    scene_root = base_out / args.dataset / args.scene
    pc_ply = scene_root / "point_cloud" / iter_dirname / "point_cloud.ply"
    pc_dir = scene_root / "point_cloud" / iter_dirname

    comp_root = scene_root / "compression"
    exp_root = comp_root / args.exp
    bitstream_root = exp_root / "bitstream"

    # 1) BB sorting
    print("Step 1: BB image sorting\n")
    run(["python", "bb_sorting_scaffold.py", str(args.exp), str(pc_ply), str(comp_root), str(cfg_root / "compression" / "generate_images_scaffold.yaml"), str(args.block_size)], env=gpu_env)
    
    # 2) JPEG XL image coding
    print("Step 2: JPEG XL image coding\n")
    ensure_dir(bitstream_root)
    run(["bash", "jxl_encoder_scaffold.sh", args.dataset, args.scene, args.exp, str(args.q), str(args.e)])

    for fname in ("color_mlp.pt", "cov_mlp.pt", "opacity_mlp.pt"):
        safe_copy(pc_dir / fname, bitstream_root / fname)
    
    for fname in ("compression_info.csv", "compression_config.yml", "attr_info.csv"):
        safe_copy(exp_root / fname, bitstream_root / fname)
    
    for fname in ("cfg_args", "cameras.json"):
        safe_copy(scene_root / fname, comp_root / fname)


if __name__ == "__main__":
    main()