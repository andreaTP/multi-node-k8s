#!/bin/bash

docker build . -t rayroestenburg/multi-node-k8s:latest
docker tag rayroestenburg/multi-node-k8s:latest docker.io/rayroestenburg/multi-node-k8s:latest
docker push docker.io/rayroestenburg/multi-node-k8s:latest