#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg0000-01"
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
    resource_group_name = "ploceusrg0000-01"
    soa_record = {
      email         = "azuredns-hostmaster.microsoft.com",
      host_name     = "ptr1-06.azure-dns.com",
      expire_time   = 2419200,
      minimum_ttl   = 300,
      refresh_time  = 3600,
      retry_time    = 300,
      serial_number = 1,
      ttl           = 3600
    }
  }
}

#DNS ZONE PTR RECORD
dns_ptr_records = {
  "ptr1" = {
    name                = "ploceusdnsptr0000-01"
    zone_name           = "ploceusdnsptr0000-01.com" #Should be same as Zone name
    resource_group_name = "ploceusrg0000-01"
    ttl                 = 100
    records             = ["ploceusdnsptr00001-1.ploceusdnsptr0000-01.com", "ploceusdnsptr0000-01-2.ploceusdnsptr0000-01.com"]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}