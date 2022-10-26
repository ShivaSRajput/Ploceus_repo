#PUBLIC DNS ZONE aaaa RECORD
variable "public_dns_zone_aaaa_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    record              = list(string)
    addAliasRecord      = bool
    target_aaaa_record = string
    tags                = map(string)
  }))
}

