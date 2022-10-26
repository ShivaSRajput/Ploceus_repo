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
    location            = "westus2"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  #NSG with one security rule 
  "network_security_group_2" = {
    name                = "ploceusnsg000002"
    resource_group_name = "ploceusrg000001"
    location            = "westus2"
    security_rule = [
      {
        name                                       = "ploceusnsgrule000002"
        priority                                   = 100
        direction                                  = "Inbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "InboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      }
    ]
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  #NSG with multiple security rules
  "network_security_group_3" = {
    name                = "ploceusnsg000003"
    resource_group_name = "ploceusrg000001"
    location            = "westus2"
    security_rule = [
      {
        name                                       = "ploceusnsgrule000003"
        priority                                   = 100
        direction                                  = "Inbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "InboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      },
      {
        name                                       = "ploceusnsgrule0000031"
        priority                                   = 100
        direction                                  = "Outbound"
        access                                     = "Allow"
        protocol                                   = "Tcp"
        source_port_range                          = "*"
        source_port_ranges                         = null
        destination_port_range                     = "*"
        destination_port_ranges                    = null
        source_address_prefix                      = "*"
        source_address_prefixes                    = null
        destination_address_prefix                 = "*"
        destination_address_prefixes               = null
        description                                = "OutboudAllow100"
        source_application_security_group_ids      = null
        destination_application_security_group_ids = null
      }
    ]
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}