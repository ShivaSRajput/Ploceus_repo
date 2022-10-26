# DNS ZONE NS RECORD VARIABLES
variable "dns_ns_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records             = list(string)
        tags = map(string)
}))
}
