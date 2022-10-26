#Variables for NSG Rules
variable "network_security_group_rules_variable" {
  type = map(object({
    name                                       = string
    resource_group_name                        = string
    network_security_group_name                = string
    description                                = string
    protocol                                   = string
    source_port_range                          = string
    source_port_ranges                         = list(string)
    destination_port_range                     = string
    destination_port_ranges                    = list(string)
    source_address_prefix                      = string
    source_address_prefixes                    = list(string)
    source_application_security_group_ids      = list(string)
    destination_address_prefix                 = string
    destination_address_prefixes               = list(string)
    destination_application_security_group_ids = list(string)
    access                                     = string
    priority                                   = string
    direction                                  = string
  }))
}