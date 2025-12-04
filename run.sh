#!/bin/bash

# 设置环境变量
export PYTHONHOME=/home/huang/miniconda3/envs/gaitnet
export PYTHONPATH=/home/huang/miniconda3/envs/gaitnet/lib/python3.6
export LD_LIBRARY_PATH=/home/huang/pkgenv/lib:$LD_LIBRARY_PATH

# 进入build目录
cd "$(dirname "$0")/build" || exit 1

# 运行程序
# 默认使用metadata.txt，也可以传入其他参数
if [ $# -eq 0 ]; then
    echo "运行默认配置: metadata.txt"
    ./imgui_render/imgui_render ../data/metadata.txt
else
    echo "运行自定义配置: $@"
    ./imgui_render/imgui_render "$@"
fi
