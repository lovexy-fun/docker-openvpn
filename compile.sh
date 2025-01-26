# 删除目录函数
function remove_dir() {
    if [ -d "$1" ]; then
        rm -rf "$1"
    fi
}

if [ ! -n "$1" ]; then
    exit 1
fi

if [ ! -e "$1" ]; then
    exit 1
fi

# 提取文件名和版本号
file=$1
basename="${file%.*.*}"
version="${basename#*-}"

# 版本号写入文件
printf "%s" "$version" > version

# 解压文件
remove_dir "openvpn-$version"
tar -xzf "$file"

# 构建镜像
docker build ./ -f compile-Dockerfile -t "lovexyfun/openvpn:$version"

# 创建target目录
remove_dir "./target"
mkdir "./target"

# 编译
docker run -v "./target:/openvpn-init/target" \
           -v "./openvpn-$version:/openvpn-init/openvpn-src" \
           -it --rm "lovexyfun/openvpn:$version" /bin/bash /openvpn-init/script/compile.sh