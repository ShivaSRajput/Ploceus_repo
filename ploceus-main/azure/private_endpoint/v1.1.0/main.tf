locals {
  is_private_dns_zone_group_required = { for k, v in var.private_endpoint_variables :
  k => v if lookup(v, "private_dns_zone_group_required", null) != false }
}

data "azurerm_virtual_network" "vnet_id" {
  for_each            = var.private_endpoint_variables
  name                = each.value.vnet_name
  resource_group_name = each.value.vnet_resource_group_name
}

data "azurerm_subnet" "subnet_id" {
  for_each             = var.private_endpoint_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_resource_group_name
}




resource "azurerm_private_endpoint" "this" {
  for_each            = var.private_endpoint_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  subnet_id           = data.azurerm_subnet.subnet_id[each.key].id
  tags                = merge(each.value.pe_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))


  private_service_connection {
    name                              = "${each.value.name}-connection"
    is_manual_connection              = each.value.is_manual_connection
    private_connection_resource_id    = each.value.private_connection_resource_id
    private_connection_resource_alias = each.value.private_connection_resource_alias
    request_message                   = each.value.request_message
    subresource_names                 = each.value.subresource_names
  }

  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_zone_group_required != false && each.value.private_dns_zone_group_required != null ? [local.is_private_dns_zone_group_required[each.key]] : []
    content {
      name                 = private_dns_zone_group.value.private_dns_zone_group_name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_group_ids
    }
  }
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}