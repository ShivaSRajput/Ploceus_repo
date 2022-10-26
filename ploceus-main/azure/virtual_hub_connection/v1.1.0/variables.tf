variable "virtual_hub_connection_variables" {
  type = map(object({
    name                            = string
    virtual_hub_name                = string
    virtual_hub_resource_group_name = string
    vnet_name                       = string
    vnet_resource_group_name        = string
  }))
}