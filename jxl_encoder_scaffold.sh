#!/bin/bash

DATASET=$1
SCENE=$2
EXPERIMENT=$3
QP=$4
E=$5

QP_geom=100


cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_2.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_2.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_3.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_3.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_4.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_4.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_5.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_5.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_6.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_6.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_7.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_7.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_8.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_8.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_9.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_9.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_10.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_10.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_11.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_11.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_12.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_12.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_13.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_13.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_14.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_14.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_15.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_15.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_16.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_16.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_17.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_17.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_18.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_18.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_19.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_19.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_20.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_20.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_21.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_21.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_22.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_22.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_23.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_23.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_24.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_24.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_25.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_25.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_26.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_26.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_27.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_27.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_28.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_28.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_offset_29.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_offset_29.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_0.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_1.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_2.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_2.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_3.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_3.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_4.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_4.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_5.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_5.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_6.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_6.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_7.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_7.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_8.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_8.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_9.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_9.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_10.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_10.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_11.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_11.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_12.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_12.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_13.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_13.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_14.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_14.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_15.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_15.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_16.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_16.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_17.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_17.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_18.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_18.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_19.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_19.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_20.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_20.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_21.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_21.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_22.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_22.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_23.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_23.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_24.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_24.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_25.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_25.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_26.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_26.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_27.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_27.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_28.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_28.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_29.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_29.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_30.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_30.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_anchor_31.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_anchor_31.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_2.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_3.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_3.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_4.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_4.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_5.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_5.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_2.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_3.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_3.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_opacity.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_opacity.jxl
