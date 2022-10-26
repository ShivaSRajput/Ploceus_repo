#Resource Group id
output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

#Vnet id
output "vnet_id" {
  value = module.vnet.vnet_id
}
#Vnet address space
output "vnet_adress_spaces" {
  value = module.vnet.vnet_address_space
}

#Subnet Id
output "subnet_id" {
  value = module.subnet.subnet_id
}

#Firewall
output "azure_firewall_id" {
  value = module.firewall.azure_firewall_id
}

#Firewall Nat Rules
output "firewall_nat_rule_collection" {
  value       = module.firewall_nat_rule_collection.firewall_nat_rule_collection
  description = "Firewall nat rule collection"
}
