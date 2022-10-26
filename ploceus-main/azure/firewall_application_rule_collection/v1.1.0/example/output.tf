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
output "firewall_id" {
  value = module.firewall.firewall_id
}

#Firewall App Rules
output "firewall_application_rule_collection_id" {
  value = module.firewall_app_rule_collection.firewall_application_rule_collection_id
}