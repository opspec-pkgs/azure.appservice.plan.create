#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for exiting appservice plan"
if [ "$(az appservice plan show --name "$name" --resource-group "$resourceGroup")" != "" ]
then
  echo "found exiting appservice plan"
else
    createCmd='az appservice plan create'
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
    createCmd=$(printf "%s --location %s" "$createCmd" "$location")
    createCmd=$(printf "%s --number-of-workers %s" "$createCmd" "$numberOfWorkers")
    createCmd=$(printf "%s --sku %s" "$createCmd" "$sku")

    # handle opts
    if [ "$isLinux" == "true" ]; then
        createCmd=$(printf "%s --is-linux" "$createCmd")
    fi

    echo "creating appservice plan"
    eval "$createCmd"
fi
