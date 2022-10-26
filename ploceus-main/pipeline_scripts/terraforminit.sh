componentName=$1
environment=$2
backendResourceGroupName=$3
backendStorageAccountName=$4
backendContainername=$5
componentType=$6
subscriptionId=$7
tenantId=$8

export ARM_USE_MSI=true
echo "componentName:"$componentName
echo "environment:"$environment
echo "backendResourceGroupName:" $backendResourceGroupName
echo "backendStorageAccountName:" $backendStorageAccountName
echo "backendContainername:" $backendContainername
echo "componentType:" $componentType

echo "AZ Login.."
az login --identity
echo "Setting Subscription"
az account set --subscription $subscriptionId
rm azure.tfvars
    cat <<EOF >> ./azure.tfvars
        resource_group_name="$backendResourceGroupName"
        storage_account_name="$backendStorageAccountName"
        container_name="$backendContainername"
        key="$componentName/$componentName.tfstate"
        access_key="$(az storage account keys list -g $backendResourceGroupName -n $backendStorageAccountName --query [0].value -o tsv)"
        subscription_id="$(az account show --query id | xargs)"
        tenant_id="$(az account show --query tenantId | xargs)"
EOF

echo "Running TF init"
terraform init  \
    -backend-config=azure.tfvars
    
if [ $? -eq 0 ]
then
  exit 0
else
  echo "Failure: check the logs of the stage." >&2
  exit 1
fi
