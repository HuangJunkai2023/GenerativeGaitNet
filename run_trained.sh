#!/bin/bash

# 设置环境变量
export PYTHONHOME=/home/huang/miniconda3/envs/gaitnet
export PYTHONPATH=/home/huang/miniconda3/envs/gaitnet/lib/python3.6
export LD_LIBRARY_PATH=/home/huang/pkgenv/lib:$LD_LIBRARY_PATH

# 进入build目录
cd "$(dirname "$0")/build" || exit 1

# 运行训练好的模型
echo "运行训练好的模型: Skeleton, Ankle, Hip, Merge"
./imgui_render/imgui_render ../data/trained_nn/Skeleton ../data/trained_nn/Ankle ../data/trained_nn/Hip ../data/trained_nn/Merge
