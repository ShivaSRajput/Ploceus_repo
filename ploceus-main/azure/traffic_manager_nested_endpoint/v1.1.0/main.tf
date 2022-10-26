data "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  for_each            = var.traffic_manager_nested_endpoint_variables
  name                = each.value.profile_name
  resource_group_name = each.value.profile_rg
}

data "azurerm_traffic_manager_profile" "traffic_manager_nested_profile" {
  for_each            = var.traffic_manager_nested_endpoint_variables
  name                = each.value.nested_profile_name
  resource_group_name = each.value.nested_profile_rg
}

resource "azurerm_traffic_manager_nested_endpoint" "traffic_nested_endpoint" {
  for_each                              = var.traffic_manager_nested_endpoint_variables
  name                                  = each.value.name
  minimum_child_endpoints               = each.value.minimum_child_endpoints
  profile_id                            = data.azurerm_traffic_manager_profile.traffic_manager_profile[each.key].id
  target_resource_id                    = data.azurerm_traffic_manager_profile.traffic_manager_nested_profile[each.key].id
  weight                                = each.value.weight
  enabled                               = each.value.enabled
  endpoint_location                     = each.value.endpoint_location
  minimum_required_child_endpoints_ipv4 = each.value.minimum_required_child_endpoints_ipv4
  minimum_required_child_endpoints_ipv6 = each.value.minimum_required_child_endpoints_ipv6
  priority                              = each.value.priority
  geo_mappings                          = each.value.geo_mappings
  dynamic "custom_header" {
    for_each = each.value.custom_header != null ? each.value.custom_header : []
    content {
      name  = custom_header.value.name
      value = custom_header.value.value
    }
  }
  dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      first = subnet.value.first
      last  = subnet.value.last
      scope = subnet.value.scope
    }
  }
}
