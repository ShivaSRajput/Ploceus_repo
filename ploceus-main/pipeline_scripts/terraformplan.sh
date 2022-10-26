componentName=$1
environment=$2
backendResourceGroupName=$3
backendStorageAccountName=$4
backendContainername=$5
componentVarfile=$6
componentDestroy=$7
subscriptionId=$8
tenantId=$9
subscription=$subscriptionId

export ARM_USE_MSI=true
echo "componentName:" $componentName
echo "environment:" $environment
echo "backendResourceGroupName:" $backendResourceGroupName
echo "backendStorageAccountName:" $backendStorageAccountName
echo "backendContainername:" $backendContainername
echo "componentVarfile:" $componentVarfile
echo "componentDestroy:" $componentDestroy
echo "subscription:" $subscription

az login --identity
az account set --subscription $subscription
rm azure.tfvars
cat <<EOF >> ./azure.tfvars
      resource_group_name="$backendResourceGroupName"
      storage_account_name="$backendStorageAccountName"
      container_name="$backendContainername"
      key="$componentName/$componentName.tfstate"
      access_key="$(az storage account keys list -g $backendResourceGroupName -n $backendStorageAccountName --query [0].value -o tsv)"
      subscription_id="$subscription"
      tenant_id="$tenantId"
EOF

terraform init  \
   -backend-config=azure.tfvars -reconfigure  
terraform workspace new $componentName 2>/dev/null
terraform workspace select $componentName

echo "subscription_id=$subscription"
echo "tenant_id=$tenantId"

terraform plan -lock=false -out $componentName.tfplan \
        -var-file="var-$componentName-auto.$componentVarfile" \
        -var="subscription_id=$subscription" \
        -var="tenant_id=$tenantId"
        
echo $componentName.tfplan

if [[ $componentDestroy == "False" ]];
then
   echo "terraform apply"
   terraform apply -lock=false $componentName.tfplan
fi

if [[ $componentDestroy == "True" ]];
then
   echo "terraform destroy"
   terraform destroy -lock=false --auto-approve \
        -var-file="var-$componentName-auto.$componentVarfile" \
        -var="subscription_id=$subscription" \
        -var="tenant_id=$tenantId"
fi

if [ $? -eq 0 ]
then
  exit 0
else
  echo "Failure: check the logs of the stage." >&2
  exit 1
fi
