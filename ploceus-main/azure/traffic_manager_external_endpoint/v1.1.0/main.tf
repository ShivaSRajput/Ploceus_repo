data "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  for_each            = var.traffic_manager_external_endpoint_variables
  name                = each.value.profile_name
  resource_group_name = each.value.profile_rg
}
resource "azurerm_traffic_manager_external_endpoint" "traffic_external_endpoint" {
  for_each          = var.traffic_manager_external_endpoint_variables
  name              = each.value.name
  profile_id        = data.azurerm_traffic_manager_profile.traffic_manager_profile[each.key].id
  target            = each.value.target
  weight            = each.value.weight
  enabled           = each.value.enabled
  endpoint_location = each.value.endpoint_location
  priority          = each.value.priority
  geo_mappings      = each.value.geo_mappings
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
