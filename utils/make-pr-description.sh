#!/usr/bin/env bash

set -e

REPO_URL="$1"

if [[ "$REPO_URL" =~ github\.com[:/]([^/]+)/([^/\.]+) ]]; then
  REPO="${BASH_REMATCH[2]}"
else
  REPO="$1"
fi

sed -e "s/_REPO_/$REPO/g" pr-description.md >"pr-descriptions/$REPO.md"
