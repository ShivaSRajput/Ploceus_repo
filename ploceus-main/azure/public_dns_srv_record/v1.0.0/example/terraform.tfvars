#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

# #Public DNS ZONE
dns_zone_variable = {
  "dnszone1" = {
    name = "ploceusdnszone.com"
    resource_group_name = "ploceusrg00001"
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
      resource_group_name = "ploceusrg00001"
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

dns_zone_srv_records = {
  "srv1" = {
    name                = "ploceusdnssrv00001"
    zone_name           = "ploceusdnszone.com" #Should be same as Zone name
    resource_group_name = "ploceusrg00001"
    ttl                 = 100
    records = [{
      priority = 1
      weight   = 10
      port     = 443
      target   = "ploceussrv1-1.ploceusdns00001.com"
      },
      {
        priority = 2
        weight   = 12
        port     = 443
        target   = "ploceussrv1-2.ploceusdns00001.com"
    }]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}