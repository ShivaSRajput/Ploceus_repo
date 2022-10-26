private_endpoints = {
  pe1 = {
    is_manual_connection           = false
    resource_group_name            = "ploceusrg000001"
    location                       = "westus2"
    private_connection_resource_id = "/subscriptions/4b19f8b4-d51d-457c-ba9f-f870519c8768/resourceGroups/XXXXXXXXXXX/providers/Microsoft.KeyVault/vaults/keyvaultPE"
    subresource_names              = ["vault"]
    request_message                = null
    name                           = "ploceuspvtendpoint000001"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  pe2 = {
    is_manual_connection           = false
    resource_group_name            = "ploceusrg000001"
    location                       = "westus2"
    private_connection_resource_id = "/subscriptions/4b19f8b4-d51d-457c-ba9f-f870519c8768/resourceGroups/ploceus/providers/Microsoft.DocumentDB/databaseAccounts/se-pattern-demo-cosmosdb-account"
    subresource_names              = ["Sql"]
    request_message                = null
    name                           = "ploceuspvtendpoint000002"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}



#VNET
vnets_variables = {
  "vnet_1" = {
    vnet_name           = "ploceusvnet000001"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = []

    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#SUBNET
subnet_variables = {
  "subnet_1" = {
    subnet_name                                    = "ploceussubnet000001"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = false
    enforce_private_link_endpoint_network_policies = false
  }
}

# keyvault_name         = "keyvaultPE"
# keyvault_resourcegroup= "dipakRG"
