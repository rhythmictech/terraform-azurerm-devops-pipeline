#!/bin/bash

PIPELINE=$1

ENDPOINT="$(az devops service-endpoint list | jq -r --arg name "${PIPELINE}-endpoint" '.[] | select(.name == $name) | .id')"

if [ -z "${ENDPOINT}" ]
then
  ENDPOINT="$(az devops service-endpoint create --service-endpoint-configuration --github-url https://github.com --name "${PIPELINE}-endpoint" --detect true -p "${PROJECT}" | jq '.id')"
fi

az pipelines create --name "${PIPELINE}" --service-connection "${ENDPOINT}" --yaml-path .azure-pipelines.yml --skip-first-run
