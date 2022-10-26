#Output VPN Site
output "vpn_sites_id" {
  value       = { for k, v in azurerm_vpn_site.vpn_site : k => v.id }
  description = "VPN site Outputs"
}