#!/usr/bin/env bash

prowlarr() {
  prowlarr_url="https://prowlarr.servarr.com/v1/update/master/changes?os=linux&runtime=netcore"
  local new_version="$(curl -sSL "${prowlarr_url}" | jq '.[0].version' -r)"

  if [ "${new_version}" ]; then
    sed -i "s/PROWLARR_VERSION=.*/PROWLARR_VERSION=${new_version}/" Dockerfile
  fi

  if output=$(git status --porcelain) && [ -z "$output" ]; then
    # working directory clean
    echo "no new prowlarr version available!"
  else
    # uncommitted changes
    git commit -a -m "updated prowlarr to version: ${new_version}"
    git push
  fi
}

prowlarr
