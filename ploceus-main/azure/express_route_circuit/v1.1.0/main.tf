resource "azurerm_express_route_circuit" "express_route_circuit" {
  for_each                 = var.express_route_circuit_variables
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  service_provider_name    = each.value.peering_location == null && each.value.bandwidth_in_mbps == null && each.value.express_route_port_id != null && each.value.bandwidth_in_gbps != null ? null : each.value.service_provider_name
  peering_location         = each.value.service_provider_name == null && each.value.bandwidth_in_mbps == null && each.value.express_route_port_id != null && each.value.bandwidth_in_gbps != null ? null : each.value.peering_location
  bandwidth_in_mbps        = each.value.service_provider_name == null && each.value.peering_location == null && each.value.express_route_port_id != null && each.value.bandwidth_in_gbps != null ? null : each.value.bandwidth_in_mbps
  allow_classic_operations = each.value.allow_classic_operations
  express_route_port_id    = each.value.peering_location != null && each.value.bandwidth_in_mbps != null && each.value.service_provider_name != null && each.value.bandwidth_in_gbps == null ? null : each.value.express_route_port_id
  bandwidth_in_gbps        = each.value.peering_location != null && each.value.bandwidth_in_mbps != null && each.value.service_provider_name != null && each.value.express_route_port_id == null ? null : each.value.bandwidth_in_gbps

  ## The service_provider_name, the peering_location and the bandwidth_in_mbps should be set together and they conflict with express_route_port_id and bandwidth_in_gbps.

  sku {
    tier   = each.value.sku.sku_tier
    family = each.value.sku.sku_family
  }

  tags = merge(each.value.express_route_circuit_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }


}

