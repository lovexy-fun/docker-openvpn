FROM ubuntu:24.04

LABEL maintainer="ll<lovexyfun@gmail.com>"

RUN mkdir /etc/openvpn

COPY ./script/init.sh /openvpn-init/script/init.sh
COPY ./config/openvpn.conf /openvpn-init/
COPY ./target/ /usr/

RUN chmod +x /openvpn-init/script/init.sh

RUN apt update && apt install -y \
    libnl-genl-3-200 \
    libcap-ng-dev \
    libssl3t64 \
    liblz4-1 \
    liblzo2-2 \
    libpam0g \
    easy-rsa \
    && apt clean
    
EXPOSE 1194

CMD [ "openvpn", "--config", "/etc/openvpn/openvpn.conf"]