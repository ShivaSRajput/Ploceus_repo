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

#PUBLIC DNS ZONE aaaa RECORD
public_dns_zone_aaaa_records =  {
aaaa_1 = {  
        name = "ploceuspublicdnsaaaa00001"
        zone_name = "plocelus.com"
        resource_group_name = "dns-zone"
        ttl = 300
        #if we want to create aaaa record we need to pass record value, addAliasRecord - false and target_aaaa_record - null
        addAliasRecord = false
        target_aaaa_record = null
        record = ["2603:1030:c02:2::30a"] 
        tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
},
aaaa_2 = {  
        name = "ploceuspublicdnsaaaa00002"
        zone_name = "plocelus.com"
        resource_group_name = "dns-zone"
        ttl = 300  
        #if we want to create Alias aaaa record we need to pass record - null, addAliasRecord - true and target_aaaa_record - "targetRecord"
        record = null    
        addAliasRecord = true
        target_aaaa_record= "ploceuspublicdnsaaaa00003"
        tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
},
aaaa_3 = {  
        name = "ploceuspublicdnsaaaa00003"
        zone_name = "plocelus.com"
        resource_group_name = "dns-zone"
        ttl = 300
        #if we want to create aaaa record we need to pass record value, addAliasRecord - false and target_aaaa_record - null
        addAliasRecord = false
        target_aaaa_record = null
        record = ["2603:1030:c02:2::30a"]
        tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
}
}
