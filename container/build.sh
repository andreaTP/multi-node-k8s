#!/bin/bash

docker build . -t rayroestenburg/ssh-server:latest
docker tag rayroestenburg/ssh-server:latest docker.io/rayroestenburg/ssh-server:latest
docker push docker.io/rayroestenburg/ssh-server:latest