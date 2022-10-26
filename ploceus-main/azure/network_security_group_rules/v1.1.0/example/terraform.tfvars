#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NSG
network_security_group_variable = {
  #NSG with none security rules
  "network_security_group_1" = {
    name                = "ploceusnsg000001"
    resource_group_name = "ploceusrg000001"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_2" = {
    name                = "ploceusnsg000002"
    resource_group_name = "ploceusrg000001"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NSG Rules
network_security_rule_variables = {
  "network_security_rule_1" = {
    network_security_rule_name                                         = "ploceusnsgrule000001"
    network_security_rule_resource_group_name                          = "ploceusrg000001"
    application_security_group_resource_group_name                     = "devops_rg"
    network_security_rule_network_security_group_name                  = "ploceusnsg000001"
    network_security_rule_priority                                     = 100
    network_security_rule_direction                                    = "Inbound"
    network_security_rule_access                                       = "Allow"
    network_security_rule_protocol                                     = "Tcp"
    network_security_rule_source_port_range                            = "*"
    network_security_rule_source_port_ranges                           = null
    network_security_rule_destination_port_range                       = "*"
    network_security_rule_destination_port_ranges                      = null
    network_security_rule_source_address_prefix                        = "*"
    network_security_rule_source_address_prefixes                      = null
    network_security_rule_destination_address_prefix                   = "*"
    network_security_rule_destination_address_prefixes                 = null
    network_security_rule_description                                  = "InboudAllow100"
    network_security_rule_source_application_security_group_names      = null
    network_security_rule_destination_application_security_group_names = null
  },
  "network_security_rule_2" = {
    network_security_rule_name                                         = "ploceusnsgrule000002"
    network_security_rule_resource_group_name                          = "ploceusrg000001"
    application_security_group_resource_group_name                     = "devops_rg"
    network_security_rule_network_security_group_name                  = "ploceusnsg000002"
    network_security_rule_priority                                     = 100
    network_security_rule_direction                                    = "Outbound"
    network_security_rule_access                                       = "Allow"
    network_security_rule_protocol                                     = "Tcp"
    network_security_rule_source_port_range                            = "*"
    network_security_rule_source_port_ranges                           = null
    network_security_rule_destination_port_range                       = null
    network_security_rule_destination_port_ranges                      = ["3389", "443"]
    network_security_rule_source_address_prefix                        = "*"
    network_security_rule_source_address_prefixes                      = null
    network_security_rule_destination_address_prefix                   = "*"
    network_security_rule_destination_address_prefixes                 = null
    network_security_rule_description                                  = "OutboudAllow100"
    network_security_rule_source_application_security_group_names      = null
    network_security_rule_destination_application_security_group_names = null
  }
}
