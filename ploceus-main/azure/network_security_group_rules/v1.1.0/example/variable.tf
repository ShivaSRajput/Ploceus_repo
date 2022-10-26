#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#Variables for NSG
variable "network_security_group_variable" {
  type = map(object({
    name                = string
    resource_group_name = string
    security_rule = list(object({
      name                                       = string
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
    network_security_group_tags = map(string)
  }))
}

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
    network_security_rule_source_application_security_group_names      = list(string)
    network_security_rule_destination_address_prefix                   = string
    network_security_rule_destination_address_prefixes                 = list(string)
    network_security_rule_destination_application_security_group_names = list(string)
    network_security_rule_access                                       = string
    network_security_rule_priority                                     = string
    network_security_rule_direction                                    = string
  }))
}