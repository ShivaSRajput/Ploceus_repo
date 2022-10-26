output "vpn_gateway_nat_rule_id" {
  value = { for k, v in azurerm_vpn_gateway_nat_rule.vpn_gateway_nat_rule : k => v.id }
}


