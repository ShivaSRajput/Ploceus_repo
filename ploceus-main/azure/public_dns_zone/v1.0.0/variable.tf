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
