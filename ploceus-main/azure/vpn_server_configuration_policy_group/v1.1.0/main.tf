data "azurerm_resources" "vpn_server_configuration" {
  type     = "Microsoft.Network/vpnServerConfigurations"
  for_each = var.vpn_server_configuration_policy_group_variables
  name     = each.value.vpn_server_configuration_id
}
resource "azurerm_vpn_server_configuration_policy_group" "vpn_server_configuration_policy_group" {
  for_each                    = var.vpn_server_configuration_policy_group_variables
  name                        = each.value.name
  vpn_server_configuration_id = data.azurerm_resources.vpn_server_configuration[each.key].resources[0].id
  is_default                  = each.value.is_default
  priority                    = each.value.priority

 dynamic "policy" {
    for_each = (each.value.policy != [] ? toset(each.value.policy) : [])
    content {
      name = policy.value.name
      type  = policy.value.type
       value = policy.value.value
    }
  }
}
