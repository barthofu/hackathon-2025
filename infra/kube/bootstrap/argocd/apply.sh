#!/bin/sh

VALUES="values.yaml"

echo "Waiting for argocd-server ingress to be created..."
kubectl get ingress argocd-server --namespace argocd \
    || VALUES="values-seed.yaml"

echo "Applying ArgoCD..."
helm template \
    --dependency-update \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    --validate=false \
    argocd . \
    | kubectl apply -n argocd -f -

echo "Waiting for ArgoCD to be ready..."
kubectl -n argocd wait --timeout=60s --for condition=Established \
       crd/applications.argoproj.io \
       crd/applicationsets.argoproj.io

echo "ArgoCD is ready! You can access it at ?????"
