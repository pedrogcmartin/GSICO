#!/bin/bash

DATASET=$1
SCENE=$2
EXPERIMENT=$3
QP=$4
E=$5

QP_geom=100

# ENCODER

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_xyz_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_xyz_2.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_dc.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_dc.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_01.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_01.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_02.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_02.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_03.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_03.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_04.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_04.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_05.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_05.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_06.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_06.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_07.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_07.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_08.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_08.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_09.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_09.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_10.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_10.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_11.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_11.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_12.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_12.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_13.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_13.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_14.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_14.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_features_rest_15.png -q $QP --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_features_rest_15.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_scaling_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_scaling_2.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_0.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_0.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_1.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_1.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_2.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_2.jxl
cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_rotation_3.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_rotation_3.jxl

cjxl ./output/$DATASET/$SCENE/compression/$EXPERIMENT/_opacity.png -q $QP_geom --allow_expert_options -e $E --disable_perceptual_optimizations ./output/$DATASET/$SCENE/compression/$EXPERIMENT/bitstream/_opacity.jxl
