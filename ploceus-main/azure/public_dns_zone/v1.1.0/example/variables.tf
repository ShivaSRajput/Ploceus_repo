#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}


variable "public_dns_zone_variable" {
  description = "Map of DNS Zone name and Resourece group name"
  type = map(object({
    public_dns_zone_name                = string
    public_dns_zone_resource_group_name = string
    public_dns_zone_soa_record = list(object({
      soa_record_email         = string
      soa_record_host_name     = string
      soa_record_expire_time   = number
      soa_record_minimum_ttl   = number
      soa_record_refresh_time  = number
      soa_record_retry_time    = number
      soa_record_serial_number = number
      soa_record_ttl           = number
    }))
    public_dns_zone_tags = map(string)
  }))
  default = {}
}
