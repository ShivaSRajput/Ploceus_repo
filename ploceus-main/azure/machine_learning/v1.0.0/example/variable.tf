#APPLICATION INSIGHTS VARIABLES
variable "application_insights_variables" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    location                  = string
    application_type          = string
    retention_in_days         = number
    disable_ip_masking        = bool
    application_insights_tags = map(string)
  }))
}


# #STORAGE ACCOUNT VARIABLES
variable "storage_account_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = string
    access_tier                       = string
    enable_https_traffic_only         = bool
    min_tls_version                   = string
    allow_blob_public_access          = bool
    large_file_share_enabled          = bool
    blob_retention_policy             = number
    container_delete_retention_policy = number
    nfsv3_enabled                     = bool
    is_hns_enabled                    = bool
    storage_account_tags              = map(string)
  }))
}



#KEY VAULT VARIABLES
variable "key_vault_variables" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    enabled_for_disk_encryption     = bool
    enabled_for_deployment          = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    soft_delete_retention_days      = string
    purge_protection_enabled        = bool
    sku_name                        = string
    key_permissions                 = list(string)
    secret_permissions              = list(string)
    storage_permissions             = list(string)
    key_vault_tags                  = map(string)
  }))
}

#CONTAINER REGISTRY VARIABLE
# variable "container_registry_variables" {
#   type = map(object({
#     name                     = string
#     resource_group_name      = string
#     location                 = string
#     sku                      = string
#     admin_enabled            = bool
#     georeplication_locations = list(string)
#     # public_network_access_enabled  = bool
#     # quarantine_policy_enabled      = bool
#     retention_policy_enabled = bool
#     retention_policy_days    = string
#     trust_policy_enabled     = bool
#     container_registry_tags  = map(string)
#   }))
# }



#MACHINE LEARNING VARIABLE
variable "machine_learning_variables" {
  type = map(object({
    name                           = string
    resource_group_name            = string
    location                       = string
    sku_name                       = string
    machine_learning_tags          = map(string)
    application_insights_name      = string
    key_vault_name                 = string
    storage_account_name           = string
    is_container_registry_required = bool
    container_registry_name        = string
    high_business_impact           = bool
    machine_learning_tags          = map(string)
  }))
}