#! /bin/bash -e

ORG="${1}"
PROJECT="${2}"

if az devops configure --defaults organization="https://dev.azure.com/${ORG}"
then
  echo "Org configured"
else
  echo "Azure Devops Organization must be created at https://dev.azure.com before this module can be run"
  exit 1
fi

if az devops project show -p "${PROJECT}" > /dev/null
then
  echo "Project ${PROJECT} already exists in org ${ORG}"
else
  echo "Creating project ${PROJECT} in org ${ORG}"
  az devops project create --name "${PROJECT}" --visibility private
  echo "Project ${PROJECT} created in org ${ORG}"
fi

az devops configure --defaults project="${PROJECT}"