variable "virtual_hub_connection_variables" {
  type = map(object({
    name                   = string
    virtual_hub_id         = string
    remote_virtual_network = string
    vnet_name              = string
    vnet_hub_name          = string
    resource_group_name    = string
  }))
}