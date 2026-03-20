#!/bin/bash

# Agregar repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Crear namespace
kubectl create namespace monitoring

# Instalar stack completo
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  -n monitoring \
  -f values.yaml

# Ver status
helm status kube-prometheus-stack -n monitoring