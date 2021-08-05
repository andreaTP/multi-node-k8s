# multi-node-k8s

Sets up Kubernetes deployments for pods that can ssh into each other by service name.
Open JDK 11 is available on the nodes.

### Build image

```
cd container
./build.sh docker.io/your-repo:version
```

### Deploy to Kubernetes

NOTE: yaml files refer to image `docker.io/rayroestenburg/multi-node-k8s:latest`, change this if needed.

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

### Example

```
./generateKeys.sh

secret "ssh-keys" deleted
secret/ssh-keys created

./setup-nodes.sh

deployment.apps "test-conductor" deleted
deployment.apps "test-node" deleted
service "test-conductor" deleted
service "test-node" deleted
deployment.apps/test-conductor created
deployment.apps/test-node created
service/test-node created
service/test-conductor created

kubectl get pods

NAME                             READY   STATUS              RESTARTS   AGE
AME                             READY   STATUS    RESTARTS   AGE
test-conductor-cdf6cff8b-gjkth   1/1     Running   0          89s
test-node-69d456b86c-j4fbx       1/1     Running   0          88s

kubectl exec -it test-conductor-cdf6cff8b-gjkth -- bash

root@test-conductor-cdf6cff8b-gjkth:/# ssh test-node

Warning: Permanently added 'test-node,10.3.248.56' (ECDSA) to the list of known hosts.
Authenticated to test-node ([10.3.248.56]:22).
```
