#Virtual Hub Security Partner Provider
data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_security_partner_provider_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_hub_security_partner_provider" "virtual_hub_security_partner_provider" {
  for_each               = var.virtual_hub_security_partner_provider_variables
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  virtual_hub_id         = data.azurerm_virtual_hub.virtual_hub[each.key].id
  security_provider_name = each.value.security_provider_name #ZScaler, IBoss and Checkpoint
  tags                   = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

