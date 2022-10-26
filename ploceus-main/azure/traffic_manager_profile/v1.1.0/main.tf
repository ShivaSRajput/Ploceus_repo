# azure traffic manager profile
resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {

  for_each               = var.traffic_manager_profiles
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  traffic_routing_method = each.value.traffic_routing_method
  profile_status         = each.value.profile_status
  traffic_view_enabled   = each.value.traffic_view_enabled

  max_return = each.value.max_return


  dns_config {
    relative_name = each.value.name
    ttl           = each.value.dns_config_ttl
  }

  monitor_config {
    protocol                     = each.value.monitor_config.protocol
    port                         = each.value.monitor_config.port
    path                         = each.value.monitor_config.path
    interval_in_seconds          = each.value.monitor_config.interval_in_seconds
    timeout_in_seconds           = each.value.monitor_config.timeout_in_seconds
    tolerated_number_of_failures = each.value.monitor_config.tolerated_number_of_failures
    expected_status_code_ranges  = each.value.monitor_config.expected_status_code_ranges
    dynamic "custom_header" {
      for_each = each.value.monitor_config.custom_header != null ? each.value.monitor_config.custom_header : {}
      content {
        name  = custom_header.key
        value = custom_header.value
      }
    }
  }

  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
