#PRIVATE DNS ZONE TXT RECORD VARIABLES
variable "private_dns_zone_txt_records" {
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records = list(object({
      value = string
    }))
    tags = map(string)
  }))
} 