#!/bin/bash

# 读取版本号
read version < version

if [ -d "target" ]; then
    rm -rf "target"
fi

if [ -d "openvpn-$version" ]; then
    rm -rf "openvpn-$version"
fi

if [ -e "version" ]; then
    rm "version"
fi

# 清理镜像
docker image prune -f