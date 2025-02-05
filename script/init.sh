cp /openvpn-init/openvpn.conf /etc/openvpn
cp /openvpn-init/client-sample.ovpn /etc/openvpn

cd /usr/share/easy-rsa
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa build-server-full server nopass
./easyrsa build-client-full client nopass
./easyrsa gen-dh
openvpn --genkey --secret ta.key

mkdir -p /etc/openvpn/server
mkdir -p /etc/openvpn/client
mkdir -p /var/log/openvpn/
mkdir -p /etc/openvpn/ccd

cp /usr/share/easy-rsa/pki/ca.crt /etc/openvpn/
cp /usr/share/easy-rsa/pki/issued/server.crt /etc/openvpn/server
cp /usr/share/easy-rsa/pki/private/server.key /etc/openvpn/server
cp /usr/share/easy-rsa/pki/issued/client.crt /etc/openvpn/client
cp /usr/share/easy-rsa/pki/private/client.key /etc/openvpn/client
cp /usr/share/easy-rsa/pki/dh.pem /etc/openvpn/
cp /usr/share/easy-rsa/ta.key /etc/openvpn/

rm /usr/share/easy-rsa/ta.key
rm -rf /usr/share/easy-rsa/pki