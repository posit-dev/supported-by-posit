#!/usr/bin/env bash

set -e

REPO_URL="$1"

if [[ "$REPO_URL" =~ github\.com[:/]([^/]+)/([^/\.]+) ]]; then
  REPO="${BASH_REMATCH[2]}"
else
  REPO="$1"
fi

(cd repos && gh repo fork "$REPO_URL" --clone=true && cd "$REPO" && git switch main)
