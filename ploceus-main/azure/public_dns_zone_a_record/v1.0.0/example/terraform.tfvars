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

#DNS ZONE
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

#PUBLIC DNS ZONE A RECORD
public_dns_zone_a_records =  {
a_record_1 = {
        name = "ploceuspublicdnsa00001"
        zone_name = "ploceuspublicdns00001.com"
        resource_group_name = "ploceusrg00001"
        ttl = 300
        #if we want to create A record we need to pass record value, addAliasRecord - false and target_a_record - null
        addAliasRecord = false
        target_a_record = null
        records = ["10.0.0.1"]
        tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
},
a_record_2 = {
        name = "ploceuspublicdnsa00002"
        zone_name = "ploceuspublicdns00001.com"
        resource_group_name = "ploceusrg00001"
        ttl = 300
        #if we want to create Alias A record we need to pass record - null, addAliasRecord - true and target_a_record - "targetRecord"
        records = null
        addAliasRecord = true
        target_a_record= "ploceuspublicdnscname00003"
        tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
}
}
