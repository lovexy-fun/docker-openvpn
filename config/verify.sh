#!/bin/bash

USER_FILE="/etc/openvpn/users.txt"

TMP_FILE=$1

USERNAME=$(sed -n '1p' "$1")
PASSWORD=$(sed -n '2p' "$2")

grep -q "^$USERNAME $PASSWORD" $USER_FILE

if [ $? -eq 0 ]; then
    exit 0
else
    exit 1
fi