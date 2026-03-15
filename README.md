# Multi-Cloud Free Tier RAG Training Platform
## <under development>
Oracle 24GB/400GB + GCP/Azure/AWS micros; K8s-federated Haystack/Milvus/Ollama.

##Execution Plan: Multi-Cloud RAG Training Platform (No Spot GPU)
Provide pathway to skip GPUs; leverage Oracle free ARM CPUs (4 OCPU/24GB) for inference/fine-tuning (e.g., LoRA on Llama.cpp); GCP/Azure/AWS free micros for redundancy. Total idle cost: $0 (free tiers); scale storage/compute PAYG (pay as you go) minimally on Oracle #2 instance. 

## Architecture Overview
K8s multi-cluster (OKE/GKE/AKS/EKS free tiers) federated via Rancher; RAG pipeline (Haystack + Milvus + Ollama) via Helm; datasets in buckets; Terraform IaC.

## Quickstart
terraform init && apply
bash scripts/deploy-rancher.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install rag-stack helm-charts/rag-stack/ -f helm-charts/values.yaml

Idle: $0. Train LoRA CPU-only.
Fork: https://github.com/YOUR/multi-cloud-rag-free
Demo: https://YOUR.github.io/multi-cloud-rag-free

## Step-by-Step Build (Timings are estimates if you follow the build process and things run flawlessly.)
1. Signups/Free Tiers (@15-30min): Oracle/GCP/Azure/AWS accounts; enable Always Free (Oracle 2 instances), $300 GCP trial
2. Terraform Infra (@30-60min): Git clone repo; tf apply for K8s clusters (1 per cloud, free ctrl plane). Oracle: 2x A1.Flex (24GB total). Var: max Oracle PAYG $0.01/hr equiv.
3. Rancher Federation (@ 20-40min): Deploy Rancher on Oracle cluster (helm install); import GKE/AKS/EKS. Unified dashboard/policy.
4. RAG Stack Deploy (Helm, @ about 45min):
   - Milvus vector DB: helm install milvus oci://registry-1.docker.io/bitnamicharts/milvus --set persistence.size=200Gi (Oracle vol).
   - Haystack pipeline: NVIDIA Blueprint Helm chart; config ingest/retrieve/generate.
   - Ollama pod: helm install ollama --set model=llama3.1:8b on Oracle ARM. VM to be Linux flavor of user choice that supports dev.
5. Data/Storage (20min): Buckets (Oracle 10GB free, GCP 5GB); sync datasets via Rclone/MinIO operator.
6. Ray/Kubeflow (30min): Helm Ray for distributed jobs; autoscaling policy (Oracle priority).
7. Access/Monitor (15min): Guacamole/Ingress for RDP-like "cloud PC"; Prometheus/Grafana for union view.
8. Test/Scale (30min): Train sample RAG (e.g., Calgary hikes docs); failover test.

## Resource Table
| Cloud        | Role               | Specs (Free)              |
| ------------ | ------------------ | ------------------------- |
| Oracle #1/#2 | Primary compute/DB | 4 OCPU/24GB, 200GB blk x2 |
| GCP          | Redundancy/ingest  | e2-micro, 30GB            |
| Azure        | Backup storage     | B1s 1GB, 64GB             |
| AWS          | S3 mirror          | t4g.nano, 30GB EBS        |

##Risks/Mitigations
- Free limits: Policy tags/alerts (Rancher).
- Latency: Toronto DCs (<50ms Calgary).
- Cost creep: Budget alarms; Oracle PAYG cap via tf vars.

##Repo Structure

multi-cloud-rag-free  
├── README.md   
├── terraform/   
│     └── main.tf   
├── helm-charts/   
|      └── values.yaml   
├── scripts/   
│     └── deploy-rancher.sh    
├── docs/    
│     └── index.html #Github pages root   
└── .gitignore   

