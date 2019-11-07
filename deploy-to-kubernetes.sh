#!/bin/zsh
version=$1
kubectl run springboot-kubernetes --image=push.com/kubernetes:0.0.1-SNAPSHOT.$version \
    --image-pull-policy=IfNotPresent \
    --port=8080
