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
