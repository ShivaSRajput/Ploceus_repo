#Output VPN Site
output "vpn_sites_id" {
  value       = module.vpn_site.vpn_sites_id
  description = "VPN Sites Output"
}