#!/bin/bash
rm -rf tmp_keys
mkdir tmp_keys
ssh-keygen -q -t rsa  -f tmp_keys/ssh_host_rsa_key -N "" -C ""
cp tmp_keys/ssh_host_rsa_key.pub ../container/authorized_keys
cp tmp_keys/ssh_host_rsa_key.pub ../container/id_rsa.pub
cp tmp_keys/ssh_host_rsa_key ../container/id_rsa
rm -rf tmp_keys