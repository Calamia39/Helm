#!/bin/bash

# Agregar repo
helm repo add metallb https://metallb.github.io/metallb
helm repo update

# Crear namespace
kubectl create namespace metallb-system

# Instalar MetalLB
helm install metallb metallb/metallb \
  -n metallb-system

# Aplicar configuración
kubectl apply -f config.yaml