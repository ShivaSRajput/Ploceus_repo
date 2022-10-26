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

#PRIVATE DNS ZONE
private_dns_zones = {
  "dns_1 " = {
    name                = "ploceusprivatedns00001.com"
    resource_group_name = "ploceusrg00001"
    soa_record_enabled  = true
    soa_record = {
      email        = "XXXXXXXXXXX@neudesic.com" #This value is required if soa_record_enabled is set to true
      expire_time  = null               #Default value is 2419200
      minimum_ttl  = null               #Default value is 10
      refresh_time = null               #Default value is 3600
      retry_time   = null               #Default value is 300
      ttl          = null               #Default value is 3600
      soa_tags = {
        Created_By = "Ploceus",
        Department = "CIS"
      }
    }
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
  "dns_2 " = {
    name                = "ploceusprivatedns00002.com"
    resource_group_name = "ploceusrg00001"
    soa_record_enabled  = false
    soa_record = {
      email        = null
      expire_time  = null
      minimum_ttl  = null
      refresh_time = null
      retry_time   = null
      ttl          = null
    soa_tags = {} }
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

private_dns_zone_srv_records = {
  "srv1" = {
    name                = "ploceusprivatednssrv00001"
    zone_name           = "ploceusprivatedns00001.com" #Should be same as Zone name
    resource_group_name = "ploceusrg00001"
    ttl                 = 100
    records = [{
      priority = 1
      weight   = 10
      port     = 443
      target   = "ploceussrv1-1.ploceusprivatedns00001.com"
      },
      {
        priority = 2
        weight   = 12
        port     = 443
        target   = "ploceussrv1-2.ploceusprivatedns00001.com"
    }]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
