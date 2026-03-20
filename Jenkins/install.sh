#!/bin/bash

# Agregar repo de Jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update

# Crear namespace
kubectl create namespace jenkins

# Instalar Jenkins
helm install jenkins jenkins/jenkins \
  -n jenkins \
  -f values.yaml

# Ver status
helm status jenkins -n jenkins

# Obtener password de admin
kubectl exec -n jenkins -it svc/jenkins -c jenkins -- \
  /bin/cat /run/secrets/additional/chart-admin-password