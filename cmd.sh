#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting appservice plan"
if [ "$(az appservice plan show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting appservice plan"
else
  echo "creating appservice plan"
  az appservice plan create \
    --name "$name" \
    --resource-group "$resourceGroup"
fi
