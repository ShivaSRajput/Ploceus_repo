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


variable "dns_zone_variable" {
  description = "Map of DNS Zone name and Resourece group name"
  type = map(object({
    name                        = string
    resource_group_name         = string
    soa_record                  = object({
      email            = string
      host_name        = string
      expire_time      = number
      minimum_ttl      = number
      refresh_time     = number
      retry_time       = number
      serial_number    = number
      ttl              = number
      })
  }))
  default = {}
}