python encoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs --q 100 --e 3 --block_size 16
python decoder_3dgs.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_3dgs
python encoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold --q 100 --e 3 --block_size 16
python decoder_scaffold.py --dataset tandt --scene truck --exp png_quant_sh_ours_lossless_scaffold
