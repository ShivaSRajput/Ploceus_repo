#FUNCTION APP

data "azurerm_app_service_plan" "app_service_plan" {
  for_each            = var.function_app_variables
  name                = each.value.app_service_plan_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  for_each            = var.function_app_variables
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_function_app" "function_app" {
  for_each                   = var.function_app_variables
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  app_service_plan_id        = data.azurerm_app_service_plan.app_service_plan[each.key].id
  client_affinity_enabled    = each.value.client_affinity_enabled
  client_cert_mode           = each.value.client_cert_mode
  enabled                    = each.value.enabled
  enable_builtin_logging     = each.value.enable_builtin_logging
  https_only                 = each.value.https_only
  os_type                    = each.value.os_type
  storage_account_name       = each.value.storage_account_name
  storage_account_access_key = data.azurerm_storage_account.storage_account[each.key].primary_access_key
  version                    = each.value.version
  identity {
    type = each.value.identity_type
    #  identity_ids = each.value.identity_type == "SystemAssigned" ? [] : each.value.identity_identity_ids
  }
  site_config {
    always_on         = each.value.site_config_always_on
    ftps_state        = each.value.site_config_ftps_state
    health_check_path = each.value.site_config_health_check_path
    http2_enabled     = each.value.site_config_http2_enabled
    #    ip_restriction            = each.value.site_config_ip_restriction
    min_tls_version           = each.value.site_config_min_tls_version
    use_32_bit_worker_process = each.value.site_config_use_32_bit_worker_process
  }
  tags = merge(each.value.function_app_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}






