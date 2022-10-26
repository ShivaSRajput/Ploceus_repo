resource "azurerm_monitor_private_link_scope" "scope" {
  for_each            = var.monitor_private_link_scope
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
}