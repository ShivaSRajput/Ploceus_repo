#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)

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

#AAZURE FRONT DOOR VARIABLE
variable "azure_front_door_variables" {
  type = map(object({
    vnet_name             = string
    azure_front_door_tags = map(string)
  }))
}