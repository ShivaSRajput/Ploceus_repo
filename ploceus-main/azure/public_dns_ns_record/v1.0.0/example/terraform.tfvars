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
dns_zone_variable = {
  "dnszone1" = {
    name                = "ploceusdnszone.com"
    resource_group_name = "ploceusrg000001"
    soa_record = {
      email         = "azuredns-hostmaster.microsoft.com",
      host_name     = "ns1-06.azure-dns.com",
      expire_time   = 2419200,
      minimum_ttl   = 300,
      refresh_time  = 3600,
      retry_time    = 300,
      serial_number = 1,
      ttl           = 3600
    }
  }
}

#DNS ZONE NS RECORD
dns_ns_records = {
  "ns1" = {
    name                = "ploceusdnsns00001"
    zone_name           = "ploceusdnsns00001.com" #Should be same as Zone name
    resource_group_name = "ploceusrg000001"
    ttl                 = 100
    records             = ["ploceusdnsns00001-1.ploceusdnsns00001.com", "ploceusdnsns00001-2.ploceusdnsns00001.com"]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}