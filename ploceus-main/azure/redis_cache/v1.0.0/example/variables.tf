variable "rg_name" {
  description = "Resource Group Name"
  default     = "testing-01"
}
variable "rg_location" {
  description = "Location"
  default     = "North Europe"
}


variable "tags" {
  description = "Map of extra tags"
  type        = map(string)
  default     = {}
}


variable "redis_cache" {
  type = map(object({
    name                          = string
    capacity                      = string
    family                        = string
    sku_name                      = string
    public_network_access_enabled = bool # true means public access, false means private access for that we need private endpoint        
    minimum_tls_version           = string
    private_static_ip_address     = string
    subnet_id                     = string
    shard_count                   = string
    enable_non_ssl_port           = bool
    redis_configuration = list(object({
      maxmemory_reserved = string
      maxmemory_delta    = string
      maxmemory_policy   = string
    }))
  }))
  description = "Map containing redis_cache information"
  default = {

  }
}


