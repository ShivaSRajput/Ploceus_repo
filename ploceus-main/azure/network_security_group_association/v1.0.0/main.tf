locals {
  #SEPERATING NIC ASSOCIATION LIST
  nic_assoc = flatten([
    for k, v in var.nsg_association_variable :
    [
      for va in coalesce(v.nic_association, []) :
      {
        nic_name            = va.nic_name
        nsg_to_associate    = va.nsg_to_associate
        resource_group_name = va.resource_group_name

      }
    ]
  ])
  #SEPERATING SUBNET ASSOCIATION LIST
  subnet_assoc = flatten([
    for k, v in var.nsg_association_variable :
    [
      for va in coalesce(v.subnet_association, []) :
      {
        vnet_name           = va.vnet_name
        snet_name           = va.snet_name
        nsg_to_associate    = va.nsg_to_associate
        resource_group_name = va.resource_group_name
      }
    ]
  ])
}

#NIC Info
data "azurerm_network_interface" "nic" {
  for_each            = { for k, v in local.nic_assoc : k => v }
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nic_nsg" {
  for_each            = { for k, v in local.nic_assoc : k => v }
  name                = each.value.nsg_to_associate
  resource_group_name = each.value.resource_group_name
}
#SUBNET Info
data "azurerm_network_security_group" "subnet_nsg" {
  for_each            = { for k, v in local.subnet_assoc : k => v }
  name                = each.value.nsg_to_associate
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = { for k, v in local.subnet_assoc : k => v }
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}
#NIC ASSOCIATION to NSG
resource "azurerm_network_interface_security_group_association" "nic_association" {
  for_each                  = { for k, v in local.nic_assoc : k => v }
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nic_nsg[each.key].id
}
#SUBNET ASSOCIATION to NSG
resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  for_each                  = { for k, v in local.subnet_assoc : k => v }
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.subnet_nsg[each.key].id
}