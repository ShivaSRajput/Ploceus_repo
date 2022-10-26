#PRIVATE DNS ZONE CNAME RECORD
variable "private_dns_zone_cname_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    record             = string
    tags                = map(string)
  }))
}
