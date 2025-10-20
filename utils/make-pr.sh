#!/usr/bin/env bash

set -e

REPO_URL="$1"

if [[ "$REPO_URL" =~ github\.com[:/]([^/]+)/([^/\.]+) ]]; then
  REPO="${BASH_REMATCH[2]}"
else
  REPO="$1"
fi

./make-pr-description.sh "$REPO"

cd "repos/$1" || exit 1
git checkout -b supported-by-posit
git add -A
git commit -m "Include supported-by-posit script"
git push -u origin supported-by-posit
gh pr create --title 'Add "Supported By Posit" badge to website' --body-file "../../pr-descriptions/$REPO.md"
