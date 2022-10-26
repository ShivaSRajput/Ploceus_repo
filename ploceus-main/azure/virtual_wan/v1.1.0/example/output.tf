#Output virtual WAN ID
output "virtual_wan" {
  value       = module.virtual_wan.virtual_wan_outputs
  description = "Virtual WAN ID's"
}