#!/bin/bash

# 准备编译环境
apt update && apt install -y \
    gcc \
    make \
    curl \
    pkg-config \
    libnl-genl-3-dev \
    libcap-ng-dev \
    libssl-dev \
    liblz4-dev \
    liblzo2-dev \
    libpam0g-dev \
    && apt clean

cd /openvpn-init/openvpn-src
./configure --prefix=/openvpn-init/target && \ 
        make && \ 
        make install && \ 
        make clean

mkdir -p /openvpn-init/target/doc/openvpn/sample
cp -r /openvpn-init/openvpn-src/sample /openvpn-init/target/doc/openvpn/