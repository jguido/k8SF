#!/bin/bash
echo ""
echo "               Kubernetes-for-Symfony"
echo ""
echo ""
echo "STARTING..."
echo ""

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
kubectl create -f $DIR/../ops/persistance.yaml
kubectl create -f $DIR/../ops/secret.yaml
kubectl create -f $DIR/../ops/symfony/deployment.yaml
kubectl create -f $DIR/../ops/symfony/service.json
kubectl create -f $DIR/../ops/mysql/statefulset.yaml
kubectl create -f $DIR/../ops/mysql/service.json
echo ""
URL_HTTP="$(minikube service symfony --url | sed -n '1 p')"
URL_HTTPS="$(minikube service symfony --url | sed -n '2 p')"
echo ""
echo "SYMFONY HTTP ENDPOINT -> ${URL_HTTP}"
echo "SYMFONY HTTPS ENDPOINT -> ${URL_HTTPS}"
echo ""
