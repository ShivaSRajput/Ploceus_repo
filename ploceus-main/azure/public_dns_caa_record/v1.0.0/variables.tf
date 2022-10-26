#PUBLIC DNS ZONE CAA RECORD VARIABLES
variable "public_dns_zone_caa_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records = list(object({
          flags = string
          tag = string
          value = string

        }))
        tags = map(string)
}))
}