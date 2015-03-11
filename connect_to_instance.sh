#! /bin/bash
set -e

# TODO: adjust this path, see skeleton.json *KeyName*
PEM_KEY_PATH=~/.ssh/vsupalov.pem

if [ $# -ne 1 ]; then
  echo "Usage: $0 [instance_ip]"
  exit 1
fi

INSTANCE_PUB_IP=$1
ssh ubuntu@$INSTANCE_PUB_IP -i $PEM_KEY_PATH
