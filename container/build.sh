#!/bin/bash
export repo=${1:-andreatp/multi-node-k8s:latest}
docker build . -t $repo
docker tag $repo docker.io/$repo
docker push docker.io/$repo