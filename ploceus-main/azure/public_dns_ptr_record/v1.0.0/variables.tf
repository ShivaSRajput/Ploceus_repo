# DNS ZONE PTR RECORD VARIABLES
variable "dns_ptr_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records             = list(string)
        tags = map(string)
}))
}
