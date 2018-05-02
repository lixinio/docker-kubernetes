#!/bin/bash

set -ex

SRC_REPO=k8s.gcr.io
DST_REPO=lixinio

KUBE_VERSION=v1.9.6

IMAGES=(
  kube-apiserver-amd64:$KUBE_VERSION
  kube-controller-manager-amd64:$KUBE_VERSION
  kube-scheduler-amd64:$KUBE_VERSION
  kube-proxy-amd64:$KUBE_VERSION
  etcd-amd64:3.1.10
  pause-amd64:3.0
  kubernetes-dashboard-amd64:v1.8.3
  defaultbackend-amd64:1.3
  heapster-amd64:v1.5.1
)


for i in ${IMAGES[@]}
do
  docker pull $SRC_REPO/$i
  docker tag $SRC_REPO/$i $DST_REPO/$i
  docker push $DST_REPO/$i
done
