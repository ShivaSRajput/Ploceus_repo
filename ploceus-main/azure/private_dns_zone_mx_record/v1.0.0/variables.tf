#PRIVATE DNS ZONE MX RECORD VARIABLES
variable "private_dns_zone_mx_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records = list(object({
          preference = string
          exchange = string
        }))
        tags = map(string)
}))
}
