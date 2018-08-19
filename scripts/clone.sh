#!/bin/bash
echo ""
echo "               Kubernetes-for-Symfony"
echo ""
echo ""
sleep 1
echo "CLONING REPOSITORY..."
echo ""
if [ -z "$REPOSITORY" ]; then
  REPOSITORY="https://github.com/symfony/symfony-standard.git"
fi

if [[ $(minikube status | grep 'minikube: Stopped') == 'minikube: Stopped' ]]; then
  echo "ERROR: Minikube is not running"
fi

if [[ $(minikube status | grep 'minikube: Running') == 'minikube: Running' ]]; then
  echo ""
  PHPCONTAINER="$(kubectl get pods | grep -o -E '^symfony-[0-9a-z\-]+') --container php"
  kubectl exec -it ${PHPCONTAINER} -- git clone $(REPOSITORY) /var/www/application/
  kubectl exec -it ${PHPCONTAINER} -- chmod -R 777 /var/www/application/var/cache/ /var/www/application/var/logs/ /var/www/application/var/sessions/
  kubectl exec -it ${PHPCONTAINER} -- composer install
fi

echo ""