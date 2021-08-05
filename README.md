# multi-node-k8s

Sets up Kubernetes deployments for pods that can ssh into each other, passwordless.
### Build image

```
cd container
./build.sh docker.io/your-repo:version
```

### Deploy to Kubernetes

```
cd kubernetes
./generateKeys.sh
./setup-nodes.sh
```