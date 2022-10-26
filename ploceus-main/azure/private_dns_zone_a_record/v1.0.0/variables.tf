#PRIVATE DNS ZONE A RECORD VARIABLES
variable "private_dns_zone_a_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records             = list(string)
    tags                = map(string)
  }))
}