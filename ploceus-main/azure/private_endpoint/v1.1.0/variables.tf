variable "private_endpoint_variables" {
  description = "Map of private endpoint objects. name, subnet_id, is_manual_connection, private_connection_resource_id and subresource_names supported"

  type = map(object({
    is_manual_connection              = bool
    resource_group_name               = string
    location                          = string
    private_connection_resource_id    = string
    private_connection_resource_alias = string
    subresource_names                 = list(string)
    request_message                   = string
    name                              = string
    pe_tags                           = map(string)
    vnet_name                         = string
    vnet_resource_group_name          = string
    subnet_name                       = string
    private_dns_zone_group_required   = bool
    private_dns_zone_group_name       = string
    private_dns_zone_group_ids        = list(string)
  }))
  default = null
}
