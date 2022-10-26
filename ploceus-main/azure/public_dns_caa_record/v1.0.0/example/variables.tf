#PUBLIC DNS ZONE VARIABLES
#Variables for public IP
variable "dns_zone_variable" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    soa_record              = object({
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

#PUBLIC DNS ZONE CAA RECORD VARIABLES
variable "public_dns_zone_caa_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records = list(object({
          flags = string
          tag = string
          value = string

        }))
        tags = map(string)
}))
}