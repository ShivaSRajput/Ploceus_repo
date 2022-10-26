variable "azurerm_backup_policy_vm" {
  type = map(object({
    name                = string
    timezone            = string
    resource_group_name = string
    recovery_vault_name = string
    backup              = map(string)
    retention_daily     = object({ count = number })
    retention_weekly = object({
      count    = number
      weekdays = list(string)
    })
    retention_monthly = object({
      count    = number
      weekdays = list(string)
      weeks    = list(string)
    })
    retention_yearly = object({
      count    = number
      weekdays = list(string)
      weeks    = list(string)
      months   = list(string)
    })
    azurerm_backup_policy_vm_tags = map(string)
  }))
  default = {
    backup_policy = {
      #(Required) Specifies the name of the Backup Policy. Changing this forces a new resource to be created
      name : "backup"
      #(Optional) Specifies the timezone. the possible values are defined here. Defaults to UTC
      timezone : "UTC"
      #(Required) The name of the resource group in which to create the policy. Changing this forces a new resource to be created
      resource_group_name = null
      #(Required) Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created
      recovery_vault_name = null
      #(Required) Sets the backup frequency
      backup = {
        #(Required) Sets the backup frequency. Must be either Daily or Weekly
        frequency = "Daily",
        #(Required) The time of day to perform the backup in 24hour format
        time = "23:00"
      }
      #(Required) The number of daily backups to keep. Must be between 7 and 9999
      retention_daily = {
        count = 10
      }
      #(Required) The number of weekly backups to keep.
      retention_weekly = {
        # Must be between 1 and 9999
        count = 42
        #(Required) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday
        weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
      }
      #(Required) The number of monthly backups to keep.
      retention_monthly = {
        #(Required) The number of monthly backups to keep. Must be between 1 and 9999
        count = 7
        #(Required) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday
        weekdays = ["Sunday", "Wednesday"]
        #(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last
        weeks = ["First", "Last"]
      }
      retention_yearly = {
        #(Required) The number of yearly backups to keep. Must be between 1 and 9999
        count = 77
        #(Required) The weekday backups to retain . Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday or Saturday
        weekdays = ["Sunday"]
        #(Required) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, Last
        weeks = ["Last"]
        #(Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, Augest, September, October, November and December
        months = ["January"]
      }
      #(Optional) A mapping of tags to assign to the resource
      azurerm_backup_policy_vm_tags : {
        automated_by = "Ploceus_Terraform"
      }
    }
  }
}
