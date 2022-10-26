#RESOURCE GROUP
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00001"
    location = "eastus"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#CONTAINER REGISTRY
container_registry_variables = {
  "container_registry_1" = {
    name                                         = "ploceusacr00001"
    location                                     = "eastus"
    resource_group_name                          = "ploceusrg00001"
    sku                                          = "Premium"
    admin_enabled                                = true
    export_policy_enabled                        = true      #In order to set it to false, make sure the public_network_access_enabled is also set to false.
    georeplication_enabled                       = false     #Only works for Premium sku
    georeplication_location                      = "EastUS2" #Only works for Premium sku
    georeplication_zone_redundancy_enabled       = true      #Only works for Premium sku
    georeplication_regional_endpoint_enabled     = true      #Only works for Premium sku
    public_network_access_enabled                = true
    quarantine_policy_enabled                    = false
    retention_policy_enabled                     = false #Only works for Premium sku 
    zone_redundancy_enabled                      = false #Only works for Premium sku 
    regional_endpoint_enabled                    = false
    anonymous_pull_enabled                       = false           #Only works with Standard and Premium SKU
    retention_policy_days                        = "7"             #Only works for Premium sku 
    trust_policy_enabled                         = false           #Only works for Premium sku 
    data_endpoint_enabled                        = false           #Only works for Premium SKU
    network_rule_bypass_option                   = "AzureServices" # Default is AzureServices, other possible value is None 
    encryption_enabled                           = false
    encryption_key_vault_key_id                  = ""
    encryption_identity_client_id                = ""
    identity_type                                = "SystemAssigned" # Other values could be "UserAssigned", "SystemAssigned, UserAssigned"
    identity_ids                                 = []
    network_rule_set_enabled                     = false # Only works with Premium SKU
    network_rule_default_action                  = "Allow"
    network_rule_set_ip_rule_enabled             = false
    network_rule_set_ip_rule_action              = "Allow"
    network_rule_set_ip_rule_range               = "10.0.0.1/16"
    network_rule_set_virtual_network_enabled     = false
    network_rule_set_virtual_network_rule_action = "Allow"
    network_rule_set_virtual_network_subnet_id   = ""
    container_registry_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    georeplication_zone_tags = {
      Created_By = "Ploceus"
      Department = "CIS"
    }
  }
}
