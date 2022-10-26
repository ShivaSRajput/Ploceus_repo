locals {
    nic_security_group_association = flatten([
      for k, v in var.network_security_group_association :
      [
        for val in coalesce(v.nic_security_group_association, []) :
        {
          network_interface_name = val.network_interface_name
          network_security_group_name = val.network_security_group_name # network_security_group_name to assiciate with network interface
          resource_group_name = val.resource_group_name
        }  
      ]
    ])
    subnet_security_group_association = flatten([
      for k,v in var.network_security_group_association :
      [
        for val in coalesce(v.subnet_security_group_association, []) :
        {
          vnet_name = val.vnet_name
          subnet_name = val.subnet_name
          network_security_group_name = val.network_security_group_name # network_security_group_name to assiciate with subnet
          resource_group_name = val.resource_group_name
        }
      ]
    ])
}

#NIC Info
data "azurerm_network_interface" "network_interface" {
  for_each            = { for k, v in local.nic_security_group_association : k => v }
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "network_interface_security_group" {
  for_each            = { for k, v in local.nic_security_group_association : k => v }
  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}
#SUBNET Info
data "azurerm_network_security_group" "subnet_network_security_group" {
  for_each            = { for k, v in   local.subnet_security_group_association : k => v }
  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = { for k, v in   local.subnet_security_group_association : k => v }
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
    for_each = { for k, v in local.nic_security_group_association : k => v }
    network_interface_id = data.azurerm_network_interface.network_interface[each.key].id
    network_security_group_id = data.azurerm_network_security_group.network_interface_security_group[each.key].id
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
    for_each = { for k, v in   local.subnet_security_group_association : k => v }
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    network_security_group_id = data.azurerm_network_security_group.subnet_network_security_group[each.key].id
}