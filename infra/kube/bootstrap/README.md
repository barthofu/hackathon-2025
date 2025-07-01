# Bootstraping ArgoCD on Kubernetes

```bash
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik --namespace kube-system

make argocd

kubectl create secret generic cert-manager-secrets --from-literal=CLOUDFLARE_API_TOKEN=your_cloudflare_api_token --namespace cert-manager

```