#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}


#CONTAINER REGISTRY VARIABLE
variable "container_registry_variables" {
  type = map(object({
    name                                         = string
    resource_group_name                          = string
    location                                     = string
    sku                                          = string
    admin_enabled                                = bool
    export_policy_enabled                        = bool
    georeplication_enabled                       = bool
    georeplication_location                      = string 
    georeplication_zone_redundancy_enabled       = bool
    georeplication_regional_endpoint_enabled     = bool
    public_network_access_enabled                = bool
    quarantine_policy_enabled                    = bool
    regional_endpoint_enabled                    = bool
    retention_policy_enabled                     = bool
    zone_redundancy_enabled                      = bool
    retention_policy_days                        = string
    trust_policy_enabled                         = bool
    data_endpoint_enabled                        = bool
    anonymous_pull_enabled                       = bool
    encryption_enabled                           = bool
    encryption_identity_client_id                = string
    encryption_key_vault_key_id                  = string
    container_registry_tags                      = map(string)
    georeplication_zone_tags                     = map(string)
    identity_type                                = string
    identity_ids                                 = list(string)
    network_rule_set_enabled                     = bool
    network_rule_default_action                  = string
    network_rule_set_ip_rule_enabled             = bool
    network_rule_set_ip_rule_action              = string
    network_rule_set_ip_rule_range               = string
    network_rule_set_virtual_network_enabled     = bool
    network_rule_set_virtual_network_rule_action = string
    network_rule_set_virtual_network_subnet_id   = string
    network_rule_bypass_option                   = string
  }))
}
