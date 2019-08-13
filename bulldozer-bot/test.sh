#/bin/sh

helm lint .
helm template .
# helm install --debug --dry-run .
