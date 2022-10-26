storage_account_sas_variables = {
  "storage_account_1" = {
    name                = "ploceustestsa"
    resource_group_name = "monitor-rg"
    Created_By          = "Ploceus"
    Department          = "CIS"


    expiry     = "2020-03-21T00:00:00Z"
    https_only = true
    permissions = [{
      add     = true
      create  = true
      delete  = true
      filter  = true
      list    = true
      process = true
      read    = true
      tag     = true
      update  = true
      write   = true
    }]
    resource_types = [{
      container = true
      object    = true
      service   = true
    }]
    services = [{
      blob  = true
      file  = true
      queue = true
      table = true
    }]
    signed_version = ""
    start          = "2020-03-21T00:00:00Z"
  }
}