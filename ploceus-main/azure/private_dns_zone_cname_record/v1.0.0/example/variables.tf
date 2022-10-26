#PRIVATE DNS ZONE VARIABLES
variable "private_dns_zones" {
  description = "Private DNS Zone Variable"
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = map(string)
    soa_record_enabled  = bool
    soa_record = object({
      email        = string
      expire_time  = number
      minimum_ttl  = number
      refresh_time = number
      retry_time = number
      ttl          = number
      soa_tags     = map(string)
    })
  }))
}

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

#PRIVATE DNS ZONE CNAME RECORD VARIABLES
variable "private_dns_zone_cname_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    record            = string
    tags                = map(string)
  }))
}
