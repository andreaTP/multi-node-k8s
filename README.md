# multi-node-k8s

Sets up Kubernetes deployments for pods that can ssh into each other, passwordless.
Open JDK 11 is available on the nodes.

### Build image

```
cd container
./build.sh docker.io/your-repo:version
```

### Deploy to Kubernetes

yaml files refer to image `docker.io/rayroestenburg/multi-node-k8s:latest`, change this if needed.

```
cd kubernetes
./generateKeys.sh
./setup-nodes.sh
```

`generateKeys.sh`:
- generates keys `id_rsa` and `id_rsa.pub` and adds the public key to `authorized_keys`
- creates an ssh-keys secret

`setup-nodes.sh`:
- sets up two deployments, `test-conductor` and `test-node`, which mount the `ssh-keys` secret, and sets up services for the two deployments.
- these nodes run an sshd server, and can ssh into each other directly through `ssh test-node` and `ssh test-conductor`