#!/bin/bash
NAMESPACE="grafana"  # Replace with your namespace

# Get the service account token
SA_TOKEN=$(oc create token grafana-sa -n $NAMESPACE)

# Create secret for the bearer token
cat <<EOF | oc apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: grafana-config
  namespace: $NAMESPACE
type: Opaque
stringData:
  SA_TOKEN: "$SA_TOKEN"
EOF
