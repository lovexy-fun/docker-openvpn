#!/bin/bash

# 读取版本号
read version < version

# 构建镜像
docker build ./ -f Dockerfile -t "lovexyfun/openvpn:$version"

# 清理
./clean.sh