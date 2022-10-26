#Output virtual WAN ID
output "Virtual_WAN" {
  value       = module.Virtual_WAN.virtual_wan_outputs
  description = "Virtual WAN ID's"
}