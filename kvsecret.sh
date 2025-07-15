#!/bin/bash

# Get all deployments and save to a file
kubectl get deployments -n com-myns -o yaml > deployments.yaml

# Extract unique secret names
secrets=$(grep -i 'secretKeyRef' deployments.yaml | awk -F 'name: ' '{print $2}' | sort | uniq)

# Loop through each secret and decode the values
for secret in $secrets; do
  echo "Secret: $secret"
  kubectl get secret $secret -n com-myns -o json | jq -r '.data | to_entries[] | "\(.key): \(.value | @base64d)"'
  echo ""
done
