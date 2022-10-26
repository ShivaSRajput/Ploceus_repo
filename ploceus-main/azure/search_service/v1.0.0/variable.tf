
#Tags to be added for the resources spun up

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    environment = "test"
  }
}



variable "search_service" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    resource_group_location       = string
    sku                           = string
    replica_count                 = string
    partition_count               = string
    public_network_access_enabled = bool # true means public access, false means private access for that we need private endpoint        
    assign_identity               = bool
  }))
  description = "Map containing search_service information"
  default = {
    "service1" = {
      name                          = "neudesic"
      resource_group_name           = "dipakRG"
      resource_group_location       = "eastus"
      sku                           = "standard"
      replica_count                 = "1"
      partition_count               = "1"
      public_network_access_enabled = false
      assign_identity               = true



    }
  }
}


variable "private_endpoints" {
  description = "Map of private endpoint objects. name, subnet_id, is_manual_connection, private_connection_resource_id and subresource_names supported"

  type = map(object({
    subnet_id            = any
    is_manual_connection = bool
    subresource_names    = list(string)
    request_message      = string
    name                 = string
  }))
  default = null
}
