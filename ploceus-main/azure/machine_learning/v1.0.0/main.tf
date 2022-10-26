data "azurerm_application_insights" "application_insight_id" {
  for_each            = var.machine_learning_variables
  name                = each.value.application_insights_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.machine_learning_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_storage_account" "storage_account_id" {
  for_each            = var.machine_learning_variables
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

locals {
  is_container_registry_exists = { for k, v in var.machine_learning_variables : k => v if lookup(v, "is_container_registry_required", false) == true }
}


data "azurerm_container_registry" "container_registry_id" {
  for_each            = local.is_container_registry_exists
  name                = each.value.container_registry_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_machine_learning_workspace" "machine_learning" {
  for_each                = var.machine_learning_variables
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  application_insights_id = data.azurerm_application_insights.application_insight_id[each.key].id
  key_vault_id            = data.azurerm_key_vault.key_vault_id[each.key].id
  storage_account_id      = data.azurerm_storage_account.storage_account_id[each.key].id
  container_registry_id   = each.value.container_registry_name == null ? null : data.azurerm_container_registry.container_registry_id[each.key].id
  high_business_impact    = each.value.high_business_impact

  identity {
    type = "SystemAssigned"
  }
  tags = merge(each.value.machine_learning_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}




