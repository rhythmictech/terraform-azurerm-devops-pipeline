#!/bin/bash

PIPELINE=$1

ENDPOINT="$(az devops service-endpoint list | jq -r --arg name "${PIPELINE}-github-endpoint" '.[] | select(.name == $name) | .id')"

if [ -z "${ENDPOINT}" ]
then
  ENDPOINT="$(az devops service-endpoint github create --github-url https://github.com --name "${PIPELINE}-github-endpoint" --detect true -p "${PROJECT}" | jq '.id')"
fi

az pipelines create --name "${PIPELINE}" --service-connection "${ENDPOINT}" --yaml-path .azure-pipelines.yml --skip-first-run
