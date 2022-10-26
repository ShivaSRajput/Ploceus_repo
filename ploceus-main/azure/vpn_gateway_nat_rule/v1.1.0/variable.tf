variable "vpn_gateway_nat_rule_variables" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    vpn_gateway_id              = string
    ip_configuration_id         = string
    mode                        = string
    type                        = string
    external_mapping            = object({
      address_space             = string
      port_range                = string
    })
    internal_mapping            = object({
      address_space             = string
      port_range                = string
    })
  }))
}
