# Multi-Cloud Free Tier RAG Training Platform

Oracle 24GB/400GB + GCP/Azure/AWS micros; K8s-federated Haystack/Milvus/Ollama.

## Quickstart
terraform init && apply
bash scripts/deploy-rancher.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install rag-stack helm-charts/rag-stack/ -f helm-charts/values.yaml

Idle: $0. Train LoRA CPU-only.
Fork: https://github.com/YOUR/multi-cloud-rag-free
Demo: https://YOUR.github.io/multi-cloud-rag-free
