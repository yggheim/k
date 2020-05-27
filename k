#!/bin/bash
set -e
CONTEXT=$(ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' < ~/.kube/config | jq -r '.contexts[].name?' | fzf --prompt="Select context:")
kubectl config use-context ${CONTEXT}
SELECTED_POD=$(kubectl get po | sed -n '1!p' | fzf --prompt="Select pod:")
POD_NAME="${SELECTED_POD%%[[:space:]]*}"
CONTAINER_NAME=$(kubectl get pods $POD_NAME -o jsonpath="{.spec.containers[*].name}" | tr ' ' '\n' | fzf --prompt="Select container:")
kubectl exec -it -c $CONTAINER_NAME $POD_NAME sh
