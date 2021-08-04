#!/bin/bash
rm -rf hostKeys
mkdir hostKeys
ssh-keygen -q -t rsa  -f hostKeys/ssh_host_rsa_key -N "" -C ""
cp hostKeys/ssh_host_rsa_key.pub ../container/authorized_keys
cp hostKeys/ssh_host_rsa_key.pub ../container/id_rsa.pub
cp hostKeys/ssh_host_rsa_key ../container/id_rsa
