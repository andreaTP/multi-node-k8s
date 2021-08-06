#!/bin/bash
rm -rf keys
mkdir -p keys
# ssh-keygen -q -t rsa  -f keys/id_rsa -N "" -C ""

cp ${HOME}/.ssh/id_rsa.pub keys/id_rsa.pub

cp keys/id_rsa.pub keys/authorized_keys
kubectl delete secret ssh-keys
kubectl create secret generic ssh-keys \
--from-file=keys/authorized_keys

# rm -rf keys
