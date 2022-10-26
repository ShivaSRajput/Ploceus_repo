#Variable for storage_data_lake_gen2_filesystem_variable

variable "storage_data_lake_gen2_filesystem_variable" {
  type                                  = map(object({

    filesystem_name                     = string
    storage_account_name                = string
    storage_account_resource_group_name = string
    filesystem_owner                    = string
    filesystem_group                    = string

    properties                          = object({
      key                               = string
    })
    ace           = list(object({
      permissions = string
      scope       = string
      type        = string
      id          = string
    }))
  }))
}

