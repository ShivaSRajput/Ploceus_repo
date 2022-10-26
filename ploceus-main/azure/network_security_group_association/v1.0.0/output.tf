output "nic_security_group_association_id" {
  value       = { for k, v in local.nic_assoc : k => azurerm_network_interface_security_group_association.nic_association[k].id }
  description = "azurerm_network_interface_security_group_association id's"
}


output "subnet_security_group_association_id" {
  value       = { for k, v in local.subnet_assoc : k => azurerm_subnet_network_security_group_association.subnet_association[k].id }
  description = "azurerm_subnet_network_security_group_association id's"
}

