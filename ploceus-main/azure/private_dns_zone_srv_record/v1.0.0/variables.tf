#PRIVATE DNS ZONE SRV RECORD VARIABLES
variable "private_dns_zone_srv_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records = list(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = map(string)
  }))
}