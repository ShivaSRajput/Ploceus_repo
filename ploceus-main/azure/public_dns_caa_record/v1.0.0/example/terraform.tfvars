#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

dns_zone_variable = {
  "dnszone1" = {
    name = "ploceuspublicdns00002.com"
    resource_group_name = "ploceusrg00002"
    soa_record = {
      email            = "azuredns-hostmaster.microsoft.com",
      host_name        = "ploceuspublicdns00002.com",
      expire_time      = 2419200,
      minimum_ttl      = 300,
      refresh_time     = 3600,
      retry_time       = 300,
      serial_number    = 1,
      ttl              = 3600      
    }
    

   },
    "dnszone2" = {
      name = "ploceuspublicdns00003.com"
      resource_group_name = "ploceusrg00002"
      soa_record = {
      email            = "azuredns-hostmaster.microsoft.com",
      host_name        = "ploceuspublicdns00003.com",
      expire_time      = 2419200,
      minimum_ttl      = 300,
      refresh_time     = 3600,
      retry_time       = 300,
      serial_number    = 1,
      ttl              = 3600  
    }

  }

}

#PUBLIC DNS ZONE CAA RECORD
public_dns_zone_caa_records = {
  "caa1" = {
    name                = "ploceuspublicdnscaa00001"
    zone_name           = "ploceuspublicdns00002.com" #Should be same as Zone name
    resource_group_name = "ploceusrg00002"
    ttl                 = 100
    records = [{
       flags = 0
       tag   = "issue"
       value = "example.net"
      },
      {
      flags = 0
      tag   = "iodef"
      value = "mailto:terraform@nonexisting.tld"
    }]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}