#CONTAINER REGISTRY
resource "azurerm_container_registry" "container_registry" {
  for_each                      = var.container_registry_variables
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  export_policy_enabled         = each.value.export_policy_enabled          
  sku                           = each.value.sku
  admin_enabled                 = each.value.admin_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  quarantine_policy_enabled     = each.value.quarantine_policy_enabled
  zone_redundancy_enabled       = each.value.zone_redundancy_enabled
  data_endpoint_enabled         = each.value.data_endpoint_enabled
  anonymous_pull_enabled        = each.value.anonymous_pull_enabled
  network_rule_bypass_option    = each.value.network_rule_bypass_option
  retention_policy {
    enabled = each.value.retention_policy_enabled
    days    = each.value.retention_policy_days
  }
  trust_policy {
    enabled = each.value.trust_policy_enabled
  }

  identity {
    type         = each.value.identity_type
    identity_ids = each.value.identity_ids
  }

  dynamic "encryption" {
    for_each = { for k, v in var.container_registry_variables : k => v if lookup(v, "encryption_enabled", false) == true }
    content {
      enabled            = each.value.encryption_enabled
      key_vault_key_id   = each.value.encryption_key_vault_key_id
      identity_client_id = each.value.encryption_identity_client_id
    }
  }


  dynamic "georeplications" {
    for_each = { for k, v in var.container_registry_variables : k => v if lookup(v, "georeplication_enabled", false) == true }
    content {
      location                  = each.value.georeplication_location
      zone_redundancy_enabled   = each.value.georeplication_zone_redundancy_enabled
      regional_endpoint_enabled = each.value.georeplication_regional_endpoint_enabled
      tags                      = each.value.georeplication_zone_tags
    }
  }
  dynamic "network_rule_set" {
    for_each = { for k, v in var.container_registry_variables : k => v if lookup(v, "network_rule_set_enabled", false) == true && lookup(v, "sku", false) == "Premium" }
    content {
      default_action = each.value.network_rule_default_action
      dynamic "ip_rule" {
        for_each = { for k, v in var.container_registry_variables : k => v if lookup(v, "network_rule_set_ip_rule_enabled", false) == true }
        content {
          action   = each.value.network_rule_set_ip_rule_action
          ip_range = each.value.network_rule_set_ip_rule_range
        }
      }
      dynamic "virtual_network" {
        for_each = { for k, v in var.container_registry_variables : k => v if lookup(v, "network_rule_set_virtual_network_enabled", false) == true }
        content {
          action    = each.value.network_rule_set_virtual_network_rule_action
          subnet_id = each.value.network_rule_set_virtual_network_subnet_id
        }
      }
    }
  }

  tags = merge(each.value.container_registry_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}


