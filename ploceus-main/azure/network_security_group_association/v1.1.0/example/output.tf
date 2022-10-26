output "nic_security_group_association_id" {
  value       = module.nsg_association.nic_security_group_association_id
  description = "azurerm_network_interface_security_group_association id's"
}

output "subnet_security_group_association_id" {
  value       = module.nsg_association.subnet_security_group_association_id
  description = "azurerm_subnet_network_security_group_association id's"
}

