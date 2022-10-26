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

#PUBLIC DNS ZONE 
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

#PUBLIC DNS ZONE MX RECORD
public_dns_zone_mx_records = {
  "mx1" = {
    name                = "ploceuspublicdnsmx00001"
    zone_name           = "ploceuspublicdns00001.com" #Should be same as Zone name
    resource_group_name = "ploceusrg00001"
    ttl                 = 100
    records = [{
      preference = 10
          exchange = "ploceuspublicdnsmx00001-1.ploceuspublicdns00001.com"
      },
      {
        preference = 20
          exchange = "ploceuspublicdnsmx00001-2.ploceuspublicdns00001.com"
    }]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}