#!/bin/bash

export LOG=${INPUT_LOG}

flags=(
  "--owner=${INPUT_OWNER}"
  "--repo=${INPUT_REPO}"
  "--number=${INPUT_NUMBER}"
  "--event=${INPUT_EVENT}"
)
args=()

github-review ${flags[@]} ${args[@]}
if [[ $? != 0 ]]; then
  echo "[ERROR] failed to run github-review" >&2
  exit 1
fi
