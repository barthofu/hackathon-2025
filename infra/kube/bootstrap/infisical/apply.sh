#!/bin/sh

infisicalToken=$(cat ../../../../../secrets/infisical/kube-main.token)

kubectl create secret generic service-token \
  --namespace=infisical \
  --type=Opaque \
  --from-literal=infisicalToken="${infisicalToken}"

# helm template \
#     --dependency-update \
#     --include-crds \
#     --namespace infisical \
#     --validate=false \
#     infisical . \
#     | kubectl apply -n infisical -f -
