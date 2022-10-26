#Output Virtual Hub Security Partner Provider
output "virtual_hub_security_partner_provider_id" {
  value = { for k, v in azurerm_virtual_hub_security_partner_provider.virtual_hub_security_partner_provider : k => v.id }
}