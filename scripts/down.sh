#!/bin/bash
echo ""
echo "               Kubernetes-for-Symfony"
echo ""
echo ""
echo "STOPPING..."
echo ""
sleep 1

kubectl delete services --all
kubectl delete deployments --all
kubectl delete statefulsets --all
kubectl delete pods --all
kubectl delete secrets --all
kubectl delete persistances --all
echo ""
while ([[ $(kubectl get pods | grep "No resources found.") == "No resources found." ]]); do
echo "Waiting, pods are not dead yet..."
sleep 5
done
sleep 1
echo ""
