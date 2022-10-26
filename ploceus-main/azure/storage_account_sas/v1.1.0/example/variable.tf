#STORAGE ACCOUNT SAS VARIABLES
variable "storage_account_sas_variables" {


  type = map(object({
    name                = string
    resource_group_name = string
    https_only          = bool
    signed_version      = string

    resource_types = list(object({
      service   = bool
      container = bool
      object    = bool
    }))

    services = list(object({
      blob  = bool
      queue = bool
      table = bool
      file  = bool
    }))

    start  = string
    expiry = string

    permissions = list(object({
      read    = bool
      write   = bool
      delete  = bool
      list    = bool
      add     = bool
      create  = bool
      update  = bool
      process = bool
      tag     = bool
      filter  = bool

    }))
  }))

}


