#!/bin/bash


# This script forwards port 14001 from the BOOKTHIEF pod to local port 8083


# shellcheck disable=SC1091
source .env

BOOKTHIEF_LOCAL_PORT="${BOOKTHIEF_LOCAL_PORT:-8083}"

POD="$(kubectl get pods --selector app=bookthief -n "$BOOKTHIEF_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"

if [ -z "$POD" ]; then
    echo "Not found pod: bookthief"
    exit 1
fi

kubectl wait -n "$BOOKTHIEF_NAMESPACE" --for=condition=ready pod --selector app=bookthief --timeout=900s

kubectl port-forward "$POD" -n "$BOOKTHIEF_NAMESPACE" "$BOOKTHIEF_LOCAL_PORT":14001 --address 0.0.0.0
