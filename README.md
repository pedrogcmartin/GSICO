<div align="center">
   <h3 align="center">Structured Gaussian Splatting Compression Codec</h3>
   <br />

  <p align="center">
   <img src="imgs/gscodec.svg">
    <br />
    <br />
  </p>
</div>

The GSICO code implementation is available in this repository. This repository is mainly based on the official authors implementation associated with the paper "3D Gaussian Splatting for Real-Time Radiance Field Rendering" and the paper "Compact 3D Scene Representation via Self-Organizing Gaussian Grids".

## Qualitative results

Visual comparison across scenes. Columns: GT (reference), baseline models (3DGS/Scaffold-GS), and our codec applied to each baseline. Values under each image show PSNR (in dB) and model size (in megabytes).

<table>
  <thead>
    <tr>
      <th align="left">Scene</th>
      <th>GT</th>
      <th>3DGS</th>
      <th>Ours w/ 3DGS</th>
      <th>Scaffold-GS</th>
      <th>Ours w/ Scaffold-GS</th>
    </tr>
  </thead>
  <tbody>
    <!-- Truck row -->
    <tr>
      <td><b>truck</b></td>
      <td><img src="imgs/truck/reference.png" width="220" alt="GT"><br/></td>
      <td><img src="imgs/truck/3DGS.png" width="220" alt="3DGS"><br/></td>
      <td><img src="imgs/truck/ours3DGS.png" width="220" alt="ours w/ 3DGS"><br/></td>
      <td><img src="imgs/truck/scaffold.png" width="220" alt="Scaffold-GS"><br/></td>
      <td><img src="imgs/truck/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"><br/></td>
    </tr>
    <tr>
      <td>PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">25.82 dB<br/>395.0 MB</td>
      <td align="center">25.45 dB<br/>19.1 MB</td>
      <td align="center">25.91 dB<br/>97.6 MB</td>
      <td align="center">25.70 dB<br/>10.9 MB</td>
    </tr>
    <!-- Train row -->
    <tr>
      <td><b>train</b></td>
      <td><img src="imgs/train/reference.png" width="220" alt="GT"></td>
      <td><img src="imgs/train/3DGS.png" width="220" alt="3DGS"></td>
      <td><img src="imgs/train/ours3DGS.png" width="220" alt="ours w/ 3DGS"></td>
      <td><img src="imgs/train/scaffold.png" width="220" alt="Scaffold-GS"></td>
      <td><img src="imgs/train/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"></td>
    </tr>
    <tr>
      <td>PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">21.93 dB<br/>217.3 MB</td>
      <td align="center">21.55 dB<br/>10.9 MB</td>
      <td align="center">22.35 dB<br/>62.3 MB</td>
      <td align="center">22.23 dB<br/>8.9 MB</td>
    </tr>
    <!-- Drjohnson row -->
    <tr>
      <td><b>drjohnson</b></td>
      <td><img src="imgs/drjohnson/reference.png" width="220" alt="GT"><br/></td>
      <td><img src="imgs/drjohnson/3DGS.png" width="220" alt="3DGS"><br/></td>
      <td><img src="imgs/drjohnson/ours3DGS.png" width="220" alt="ours w/ 3DGS"><br/></td>
      <td><img src="imgs/drjohnson/scaffold.png" width="220" alt="Scaffold-GS"><br/></td>
      <td><img src="imgs/drjohnson/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"><br/></td>
    </tr>
    <tr>
      <td width="105">PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">28.97 dB<br/>232.9 MB</td>
      <td align="center">28.67 dB<br/>11.9 MB</td>
      <td align="center">29.75 dB<br/>62.7 MB</td>
      <td align="center">29.63 dB<br/>7.0 MB</td>
    </tr>
    <!-- Playroom row -->
    <tr>
      <td><b>playroom</b></td>
      <td><img src="imgs/playroom/reference.png" width="220" alt="GT"></td>
      <td><img src="imgs/playroom/3DGS.png" width="220" alt="3DGS"></td>
      <td><img src="imgs/playroom/ours3DGS.png" width="220" alt="ours w/ 3DGS"></td>
      <td><img src="imgs/playroom/scaffold.png" width="220" alt="Scaffold-GS"></td>
      <td><img src="imgs/playroom/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"></td>
    </tr>
    <tr>
      <td>PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">30.19 dB<br/>213.6 MB</td>
      <td align="center">29.64 dB<br/>10.7 MB</td>
      <td align="center">30.92 dB<br/>52.0 MB</td>
      <td align="center">30.73 dB<br/>5.6 MB</td>
    </tr>
    <!-- Bicycle row -->
    <tr>
      <td><b>bicycle</b></td>
      <td><img src="imgs/bicycle/reference.png" width="220" alt="GT"><br/></td>
      <td><img src="imgs/bicycle/3DGS.png" width="220" alt="3DGS"><br/></td>
      <td><img src="imgs/bicycle/ours3DGS.png" width="220" alt="ours w/ 3DGS"><br/></td>
      <td><img src="imgs/bicycle/scaffold.png" width="220" alt="Scaffold-GS"><br/></td>
      <td><img src="imgs/bicycle/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"><br/></td>
    </tr>
    <tr>
      <td width="105">PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">25.10 dB<br/>753.4 MB</td>
      <td align="center">24.70 dB<br/>36.8 MB</td>
      <td align="center">25.21 dB<br/>310.1 MB</td>
      <td align="center">24.78 dB<br/>33.2 MB</td>
    </tr>
    <!-- Kitchen row -->
    <tr>
      <td><b>kitchen</b></td>
      <td><img src="imgs/kitchen/reference.png" width="220" alt="GT"></td>
      <td><img src="imgs/kitchen/3DGS.png" width="220" alt="3DGS"></td>
      <td><img src="imgs/kitchen/ours3DGS.png" width="220" alt="ours w/ 3DGS"></td>
      <td><img src="imgs/kitchen/scaffold.png" width="220" alt="Scaffold-GS"></td>
      <td><img src="imgs/kitchen/oursscaffold.png" width="220" alt="ours w/ Scaffold-GS"></td>
    </tr>
    <tr>
      <td>PSNR [dB]<br/>Size [MB]</td>
      <td align="center">–</td>
      <td align="center">31.34 dB<br/>301.7 MB</td>
      <td align="center">29.24 dB<br/>16.0 MB</td>
      <td align="center">31.60 dB<br/>107.0 MB</td>
      <td align="center">31.04 dB<br/>11.9 MB</td>
    </tr>
  </tbody>
</table>



## Cloning the Repository

The repository contains submodules, thus please check it out with

```shell
# SSH
git clone git@github.com:pedrogcmartin/GSICO.git --recursive
```

or

```shell
# HTTPS
git clone https://github.com/pedrogcmartin/GSICO.git --recursive
```

## Python Environment

The code is using a few additional Python packages on top of graphdeco-inria/gaussian-splatting. We provide an extended environment.yml:

Installation with [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html):

```shell
micromamba env create --file environment.yml --channel-priority flexible -y
micromamba activate gsico
```


## JPEG XL Installation

The codec makes use of JPEG XL encoder and decoder. For installation use the [jpeg-xl](https://gitlab.com/wg1/jpeg-xl) reference software.

## Running

Download a dataset, e.g. [T&T](https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/tandt_db.zip).

The codec supports both 3DGS-based and Scaffold-GS-based models.

To encode and decode a GS file generated by a 3DGS-based model use the following commands:

```shell
python encoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs --q 100 --e 3 --block_size 16
```
```shell
python decoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs
```

To encode and decode a GS file generated by a Scaffold-GS-based model use the following commands:

```shell
python encoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold --q 100 --e 3 --block_size 16
```
```shell
python decoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold
```

where the JPEG XL settings are controlled by the quality level (`--q`, from -inf to 100, being 100 mathematically lossless) and the effort level (`--e`, from 1 to 11) and the BB sorting block size can be adjusted using --block_size.
