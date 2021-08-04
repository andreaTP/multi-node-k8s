#!/bin/bash
kubectl delete deployments,services -l app=multi-node-test
kubectl apply -f test-conductor-deployment.yaml
kubectl apply -f test-node-deployment.yaml
kubectl apply -f test-node-service.yaml
kubectl apply -f test-conductor-service.yaml