#VIRTUAL WAN 
resource "azurerm_virtual_wan" "vwan" {
  for_each                          = var.virtual_wan_variables
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  disable_vpn_encryption            = each.value.disable_vpn_encryption
  allow_branch_to_branch_traffic    = each.value.allow_branch_to_branch_traffic
  office365_local_breakout_category = each.value.office365_local_breakout_category
  type                              = each.value.type
  tags                              = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
}




