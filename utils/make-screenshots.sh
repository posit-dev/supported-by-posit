#!/usr/bin/env bash

set -e

REPO_URL="$1"

if [[ "$REPO_URL" =~ github\.com[:/]([^/]+)/([^/\.]+) ]]; then
  REPO="${BASH_REMATCH[2]}"
else
  REPO="$1"
fi

(cd "repos/$REPO" && Rscript -e "pkgdown::init_site(); pkgdown::build_home()")

if [ -d "repos/$REPO/docs/dev" ]; then
  DEV="/dev"
else
  DEV=""
fi

./screenshot.sh "repos/$REPO/docs$DEV/index.html" 1200 "screenshots/$REPO-1200.png"
./screenshot.sh "repos/$REPO/docs$DEV/index.html" 992 "screenshots/$REPO-992.png"
./screenshot.sh "repos/$REPO/docs$DEV/index.html" 991 "screenshots/$REPO-991.png"
