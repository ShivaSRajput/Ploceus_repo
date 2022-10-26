#PRIVATE DNS ZONE AAAA RECORD VARIABLES
variable "private_dns_zone_aaaa_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records = list(string)
        tags = map(string)
}))
}