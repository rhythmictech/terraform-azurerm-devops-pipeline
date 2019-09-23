#!/bin/bash -e

if az --version > /dev/null
then
  echo "Azure CLI is installed"
else
  echo "Azure CLI not installed"
  exit 1
fi

if az extension show --name azure-devops > /dev/null
then
  echo "Extension already installed"
else
  az extension add --name azure-devops
  echo "Extension has been installed"
fi