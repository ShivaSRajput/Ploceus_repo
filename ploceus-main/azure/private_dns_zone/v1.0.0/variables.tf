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