#Variables for NSG Rules
variable "network_security_rule_variables" {
  type = map(object({
    network_security_rule_name                                         = string
    network_security_rule_resource_group_name                          = string
    application_security_group_resource_group_name                     = string
    network_security_rule_network_security_group_name                  = string
    network_security_rule_description                                  = string
    network_security_rule_protocol                                     = string
    network_security_rule_source_port_range                            = string
    network_security_rule_source_port_ranges                           = list(string)
    network_security_rule_destination_port_range                       = string
    network_security_rule_destination_port_ranges                      = list(string)
    network_security_rule_source_address_prefix                        = string
    network_security_rule_source_address_prefixes                      = list(string)
    network_security_rule_source_application_security_group_names        = list(string)
    network_security_rule_destination_address_prefix                   = string
    network_security_rule_destination_address_prefixes                 = list(string)
    network_security_rule_destination_application_security_group_names   = list(string)
    network_security_rule_access                                       = string
    network_security_rule_priority                                     = string
    network_security_rule_direction                                    = string
  }))
}