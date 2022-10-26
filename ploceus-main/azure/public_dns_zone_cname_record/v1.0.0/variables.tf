#PUBLIC DNS ZONE CNAME RECORD
variable "public_dns_zone_cname_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    record              = string
    addAliasRecord      = bool
    target_cname_record = string
    tags                = map(string)
  }))
}

