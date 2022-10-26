# This module helps us to create Azure Key Vault Resource

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  for_each                        = var.key_vault_variables
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  enable_rbac_authorization       = each.value.enable_rbac_authorization
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  purge_protection_enabled        = each.value.purge_protection_enabled
  sku_name                        = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = each.value.access_policy_certificate_permissions
    key_permissions         = each.value.access_policy_key_permissions
    secret_permissions      = each.value.access_policy_secret_permissions
    storage_permissions     = each.value.access_policy_storage_permissions
  }

  dynamic "network_acls" {
    #for_each = each.value.network_acls_enabled == true ? [true] : []
    for_each = { for k, v in var.key_vault_variables : k => v if lookup(v, "network_acls_enabled", true) == true }
    content {
      bypass                     = each.value.network_acls_bypass
      default_action             = each.value.network_acls_default_action
      ip_rules                   = each.value.network_acls_ip_rules
      virtual_network_subnet_ids = each.value.network_acls_virtual_network_subnet_ids
    }
  }

  dynamic "contact" {
    #for_each = each.value.contact_information_enabled == true ? [true] : []
    for_each = { for k, v in var.key_vault_variables : k => v if lookup(v, "contact_information_enabled", true) == true }
    content {
      email = each.value.contact_email
      name  = each.value.contact_name
      phone = each.value.contact_phone
    }
  }

  tags = merge(each.value.key_vault_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}