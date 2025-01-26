# OpenVPN的docker镜像构建

## 构建

1. 下载要构建版本的openvpn源码包

2. 增加执行权限`chmod +x compile.sh build.sh clean.sh`

3. 执行`./compile.sh openvpn-x.x.x.tar.gz`构建镜像进行编译

4. 执行`./build.sh`构建实际使用的镜像

## 使用

1. 拉取镜像

```bash
docker pull lovexyfun/openvpn:2:6:13
```

2. 初始化

```bash
docker run --rm -v ./openvpn-config:/etc/openvpn -it lovexyfun/openvpn:2.6.13 /bin/bash /openvpn-init/script/init.sh
```

3. 启动

```bash
docker run -v ./openvpn-config:/etc/openvpn -v ./openvpn-log:/var/log/openvpn --cap-add=NET_ADMIN --device=/dev/net/tun lovexyfun/openvpn:2.6.13
```