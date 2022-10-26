#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name                = "ploceusrg000001"
    location            = "westus2"
    resource_group_tags = {
      Created_By        = "Ploceus",
      Department        = "CIS"
    }
  }
}

dns_zone_variable = {
  "dnszone1" = {
    name = "ploceusdnszone.com"
    resource_group_name = "ploceusrg000001"
    soa_record = {
      email            = "azuredns-hostmaster.microsoft.com",
      host_name        = "ns1-06.azure-dns.com",
      expire_time      = 2419200,
      minimum_ttl      = 300,
      refresh_time     = 3600,
      retry_time       = 300,
      serial_number    = 1,
      ttl              = 3600      
    }
    

   },
    "dnszone2" = {
      name = "ploceustestdnszone.com"
      resource_group_name = "ploceusrg000001"
      soa_record = {
      email            = "azuredns-hostmaster.microsoft.com",
      host_name        = "ns1-06.azure-dns.com",
      expire_time      = 2419200,
      minimum_ttl      = 300,
      refresh_time     = 3600,
      retry_time       = 300,
      serial_number    = 1,
      ttl              = 3600  
    }

  }

}