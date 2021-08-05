#!/bin/bash
rm -rf keys
mkdir keys
ssh-keygen -q -t rsa  -f keys/id_rsa -N "" -C ""
cp keys/id_rsa.pub keys/authorized_keys
kubectl delete secret ssh-keys
kubectl create secret generic ssh-keys \
--from-file=keys/id_rsa \
--from-file=keys/id_rsa.pub \
--from-file=keys/authorized_keys

rm -rf keys