#!/bin/bash

DATASET=$1
SCENE=$2
EXPERIMENT=$3
QP=$4
E=$5

QP_geom=100


djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_xyz_2.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_2.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_3.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_3.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_4.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_4.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_5.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_5.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_6.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_6.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_7.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_7.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_8.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_8.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_9.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_9.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_10.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_10.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_11.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_11.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_12.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_12.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_13.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_13.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_14.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_14.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_15.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_15.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_16.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_16.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_17.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_17.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_18.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_18.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_19.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_19.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_20.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_20.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_21.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_21.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_22.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_22.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_23.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_23.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_24.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_24.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_25.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_25.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_26.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_26.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_27.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_27.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_28.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_28.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_29.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_offset_29.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_2.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_3.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_3.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_4.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_4.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_5.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_5.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_6.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_6.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_7.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_7.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_8.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_8.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_9.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_9.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_10.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_10.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_11.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_11.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_12.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_12.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_13.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_13.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_14.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_14.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_15.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_15.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_16.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_16.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_17.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_17.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_18.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_18.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_19.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_19.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_20.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_20.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_21.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_21.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_22.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_22.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_23.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_23.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_24.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_24.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_25.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_25.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_26.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_26.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_27.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_27.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_28.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_28.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_29.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_29.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_30.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_30.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_31.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_features_anchor_31.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_2.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_3.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_3.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_4.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_4.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_5.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_scaling_5.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_0.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_0.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_1.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_1.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_2.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_2.png
djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_3.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_rotation_3.png

djxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_opacity.jxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/decoded/_opacity.png
