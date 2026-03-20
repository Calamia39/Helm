#!/bin/bash

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl create namespace ingress-nginx

helm install ingress-nginx ingress-nginx/ingress-nginx \
  -n ingress-nginx \
  -f values.yaml
```

---

## 📁 Estructura del Repositorio
```
homelab-helm/
├── README.md
├── jenkins/
│   ├── values.yaml
│   ├── install.sh
│   └── upgrade.sh
├── prometheus/
│   ├── values.yaml
│   ├── install.sh
│   └── dashboards/
├── metallb/
│   ├── values.yaml
│   ├── config.yaml
│   └── install.sh
├── cert-manager/
│   ├── values.yaml
│   ├── install.sh
│   └── cluster-issuer.yaml
├── ingress-nginx/
│   ├── values.yaml
│   └── install.sh
└── scripts/
    ├── backup-all.sh
    └── update-all.sh