#deploy-rancher.sh
#!/bin/bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
kubectl create ns cattle-system
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  -s values.yaml --set hostname=rancher.YOURDOMAIN \
  --set replicas=1 --set bootstrapPassword=admin
# Import: kubectl apply -f import-gke.yaml etc. (add files)
helm repo add bitnami https://charts.bitnami.com/bitnami
