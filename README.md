<div align="center">
   <h3 align="center">Structured Gaussian Splatting Compression Codec</h3>
   <br />

  <p align="center">
   <object data="https://raw.githubusercontent.com/pedrogcmartin/SGS/main/imgs/gscodec.pdf" type="application/pdf" width="100%" height="600px"></object>
    <br />
    <br />
  </p>
</div>

### Code

This repository is a fork of the official authors implementation associated with the paper "3D Gaussian Splatting for Real-Time Radiance Field Rendering".

The code for "Compact 3D Scene Representation via Self-Organizing Gaussian Grids" consists of multiple parts. The multi-dimensional sorting algorithm, PLAS, is available under the Apache License at [fraunhoferhhi/PLAS](https://github.com/fraunhoferhhi/PLAS).

The integration of the sorting, the smoothness regularization and the compression code for training and compressing 3D scenes is available in this repository.

## Cloning the Repository

The repository contains submodules, thus please check it out with

```shell
# SSH
git clone git@github.com:fraunhoferhhi/Self-Organizing-Gaussians.git --recursive
```

or

```shell
# HTTPS
git clone https://github.com/fraunhoferhhi/Self-Organizing-Gaussians.git --recursive
```

## Python Environment

The code is using a few additional Python packages on top of graphdeco-inria/gaussian-splatting. We provide an extended environment.yml:

Installation with [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html):

```shell
micromamba env create --file environment.yml --channel-priority flexible -y
micromamba activate sogs
```

## Example training

Download a dataset, e.g. [T&T](https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/tandt_db.zip).

The train.py script expects a name to a .yaml config file in the [config/](config/) folder. All parameters for the run are by default loaded from the yaml file. An example launch file can be found in .vscode/launch.json, for launching from Visual Studio Code.

Example:

```shell
python train.py \
  --config-name ours_q_sh_local_test \
  hydra.run.dir=/data/output/${now:%Y-%m-%d}/${now:%H-%M-%S}-${run.name} \
  dataset.source_path=/data/gaussian_splatting/tandt_db/tandt/truck \
  run.no_progress_bar=false \
  run.name=vs-code-debug
```


python encoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs --q 100 --e 3 --block_size 16
python decoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs
python encoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold --q 100 --e 3 --block_size 16
python decoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold
