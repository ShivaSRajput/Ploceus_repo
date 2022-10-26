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

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

# #DDOS protection plan variable
# variable "ddos_protection_plan_variables" {
#   type = map(object({
#     name                            = string
#     resource_group_name             = string
#     location                        = string
#     ddos_protection_plan_tags       = map(string)
#   }))
# }

#NIC Variables
variable "nic_variables" {
  type = map(object({
    name                                             = string
    resource_group_name                              = string
    location                                         = string
    internal_dns_name_label                          = string
    enable_ip_forwarding                             = bool
    enable_accelerated_networking                    = bool
    dns_servers                                      = list(string)
    ip_configuration_name                            = string
    subnet_name                                      = string
    vnet_name                                        = string
    is_gateway_load_balancer_required_to_be_attached = bool
    is_public_required                               = bool
    public_ip_name                                   = string
    private_ip_address_version                       = string
    private_ip_address_allocation                    = string
    primary                                          = bool
    private_ip_address                               = string
    nic_tags                                         = map(string)
  }))
}

#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {}
}

#Variables for public IP
variable "public_ip_variable" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    availability_zone       = string
    reverse_fqdn            = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
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


#Variables for NSG Association
variable "nsg_association_variable" {
  type = map(object({
    nic_association = list(object({
      nic_name            = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
    subnet_association = list(object({
      vnet_name           = string
      snet_name           = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
  }))
}
