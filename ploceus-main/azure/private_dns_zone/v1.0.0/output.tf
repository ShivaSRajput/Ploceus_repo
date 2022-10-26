# output "private_dns_zones" {
#   value = [
#     for k, v in var.private_dns_zones :
#     {
#       private_dns_id                                        = azurerm_private_dns_zone.pvt_dns_zone[k].id
#       soa_record                                            = azurerm_private_dns_zone.pvt_dns_zone[k].soa_record
#       number_of_record_sets                                 = azurerm_private_dns_zone.pvt_dns_zone[k].number_of_record_sets
#       max_number_of_record_sets                             = azurerm_private_dns_zone.pvt_dns_zone[k].max_number_of_record_sets
#       max_number_of_virtual_network_links                   = azurerm_private_dns_zone.pvt_dns_zone[k].max_number_of_virtual_network_links
#       max_number_of_virtual_network_links_with_registration = azurerm_private_dns_zone.pvt_dns_zone[k].max_number_of_virtual_network_links_with_registration
#     }
#   ]
#   description = "Private DNS Zone Outputs"
# }

output "private_dns_zones" {
  value = azurerm_private_dns_zone.pvt_dns_zone
  description = "Private DNS Zone Outputs"
}