#PRIVATE DNS ZONE PTR Record VARIABLES
variable "private_dns_zone_ptr_records" {
    type = map(object({
        name = string
        zone_name = string
        resource_group_name = string
        ttl = number
        records = list(string)
        tags = map(string)
}))
}