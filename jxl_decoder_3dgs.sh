#!/bin/bash

DATASET=$1
SCENE=$2
EXPERIMENT=$3


djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_2.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_dc.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_dc.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_01.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_01.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_02.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_02.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_03.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_03.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_04.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_04.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_05.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_05.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_06.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_06.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_07.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_07.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_08.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_08.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_09.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_09.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_10.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_10.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_11.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_11.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_12.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_12.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_13.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_13.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_14.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_14.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_15.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_rest_15.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_2.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_2.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_3.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_3.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_opacity.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_opacity.png
