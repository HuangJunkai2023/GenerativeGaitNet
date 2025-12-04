#!/usr/bin/env bash
ENVDIR=${ENVDIR:-~/pkgenv}
# If CentOS server, set C++ compiler manually
if [ -f /etc/redhat-release ]; then
    export CC=/opt/ohpc/pub/compiler/gcc/8.3.0/bin/gcc
    export CXX=/opt/ohpc/pub/compiler/gcc/8.3.0/bin/g++
fi

mkdir -p build
pushd build

# 设置Python路径（使用conda环境）
PYTHON_ROOT=${PYTHON_ROOT:-~/miniconda3/envs/gaitnet}

cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$ENVDIR \
      -DCMAKE_INSTALL_PREFIX=$ENVDIR \
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE \
      -DCMAKE_INSTALL_RPATH=$ENVDIR \
      -DFCL_INCLUDE_DIRS=$ENVDIR/include/fcl \
      -DPYTHON_EXECUTABLE=$PYTHON_ROOT/bin/python \
      -DPYTHON_INCLUDE_DIR=$PYTHON_ROOT/include/python3.6m \
      -DPYTHON_LIBRARY=$PYTHON_ROOT/lib/libpython3.6m.so \
      -DPYBIND11_PYTHON_VERSION=3.6 \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -Wno-dev \
      ..
popd