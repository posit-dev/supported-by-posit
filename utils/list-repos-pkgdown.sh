#!/bin/bash
ORG="$1"
PAGE=1

while true; do
  response=$(curl -s "https://api.github.com/orgs/$ORG/repos?per_page=100&page=$PAGE")
  # Extract repo names
  repos=$(echo "$response" | grep '"full_name":' | sed 's/.*"full_name": "\(.*\)".*/\1/' | tr -d ',')

  # Break if no repos found
  if [ -z "$repos" ]; then
    break
  fi

  # Check each repo for _pkgdown.yml
  while IFS= read -r repo; do
    # Check if _pkgdown.yml exists in the root
    status_root=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/$repo/HEAD/_pkgdown.yml")

    # Check if _pkgdown.yml exists in pkgdown subdirectory
    status_pkgdown=$(curl -s -o /dev/null -w "%{http_code}" "https://raw.githubusercontent.com/$repo/HEAD/pkgdown/_pkgdown.yml")

    if [ "$status_root" = "200" ] || [ "$status_pkgdown" = "200" ]; then
      echo "https://github.com/$repo"
    else
      echo "Error: _pkgdown.yml not found in https://github.com/$repo" >&2
    fi
  done <<<"$repos"

  ((PAGE++))
done
