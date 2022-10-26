#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

public_dns_zone_variable = {
  "dnszone1" = {
    public_dns_zone_name                = "ploceuspublicdnszone000001.com"
    public_dns_zone_resource_group_name = "ploceusrg000001"
    public_dns_zone_soa_record = [
      {
        soa_record_email         = "xxxxxxx.ploceus.com",
        soa_record_host_name     = "ns1-06.azure-dns.com",
        soa_record_expire_time   = 2419200,
        soa_record_minimum_ttl   = 300,
        soa_record_refresh_time  = 3600,
        soa_record_retry_time    = 300,
        soa_record_serial_number = 1,
        soa_record_ttl           = 3600
      }
    ]
    public_dns_zone_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "dnszone2" = {
    public_dns_zone_name                = "ploceuspublicdnszone000002.com"
    public_dns_zone_resource_group_name = "ploceusrg000001"
    public_dns_zone_soa_record = [
      {
        soa_record_email         = "xxxxxxx.ploceus.com",
        soa_record_host_name     = "ns1-06.azure-dns.com",
        soa_record_expire_time   = 2419200,
        soa_record_minimum_ttl   = 300,
        soa_record_refresh_time  = 3600,
        soa_record_retry_time    = 300,
        soa_record_serial_number = 1,
        soa_record_ttl           = 3600
      }
    ]
    public_dns_zone_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
