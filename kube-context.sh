#!/usr/bin/env bash

# default kube config file, check for provided directory
DEFAULT_KUBECONFIG="$HOME/.kube/config"

# if it exists, add it into the KUBECONFIG variable
# otherwise, clear it for further use
if test -f $DEFAULT_KUBECONFIG; then
  export KUBECONFIG="$DEFAULT_KUBECONFIG:"
else export KUBECONFIG=""; fi

# set and create the custom kube contexts directory
CONTEXTS="${1-"$HOME/.kube/contexts"}"; mkdir -p $CONTEXTS

# find all .yml and .yaml files in the custom contexts directory
# and incorporate them into the KUBECONFIG variable for easier context
# switching
find $CONTEXTS -type f \( -name "*.yml" -o -name "*.yaml" \) \
  -print0 | while IFS= read -r -d '' context; do
    export KUBECONFIG="${KUBECONFIG}${context}:"
  done

# make sure the KUBECONFIG variable looks clean
export KUBECONFIG="${KUBECONFIG: :-1}"
