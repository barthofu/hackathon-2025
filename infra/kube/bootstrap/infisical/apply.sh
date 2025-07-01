#!/bin/sh

kubectl create secret generic service-token \
  --namespace=infisical \
  --type=Opaque \
  --from-literal=infisicalToken="${INFISICAL_TOKEN}"

# helm template \
#     --dependency-update \
#     --include-crds \
#     --namespace infisical \
#     --validate=false \
#     infisical . \
#     | kubectl apply -n infisical -f -
