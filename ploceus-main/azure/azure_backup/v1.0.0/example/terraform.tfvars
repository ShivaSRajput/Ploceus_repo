#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#RECOVERY SERVICES VAULT VARIABLE
recovery_service_vault_variable = {
  "recovery_service_vault_1" = {
    name                = "ploceusrsv000001"
    resource_group_name = "ploceusrg000001"
    sku                 = "Standard"
    soft_delete_enabled = true
    identity            = null
    storage_mode_type   = null
    encryption          = null
    tags = {
      Created_By = "ploceus"
    }
  },
  "recovery_service_vault_2" = {
    name                = "ploceusrsv000002"
    sku                 = "Standard"
    resource_group_name = "ploceusrg000001"
    soft_delete_enabled = true
    identity            = null
    storage_mode_type   = null
    encryption          = null
    tags = {
      Created_By = "ploceus"
    }
  }
}


#BACKUP POLICY
azurerm_backup_policy_vm = {
  backup_policy_1 = {
    #(Required) Specifies the name of the Backup Policy. Changing this forces a new resource to be created
    name = "ploceusbkp000001"
    #(Optional) Specifies the timezone. the possible values are defined here. Defaults to UTC
    timezone = "UTC"
    #(Required) The name of the resource group in which to create the policy. Changing this forces a new resource to be created
    resource_group_name = "ploceusrg000001"
    #(Required) Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created
    recovery_vault_name = "ploceusrsv000001"
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
    azurerm_backup_policy_vm_tags = {
      automated_by = "Ploceus_Terraform"
    }
  },
  backup_policy_2 = {
    #(Required) Specifies the name of the Backup Policy. Changing this forces a new resource to be created
    name = "ploceusbkp000002"

    #(Required) The name of the resource group in which to create the policy. Changing this forces a new resource to be created
    resource_group_name = "ploceusrg000001"
    #(Required) Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created
    recovery_vault_name = "ploceusrsv000002"
    #(Required) Sets the backup frequency
    backup = {
      #(Required) Sets the backup frequency. Must be either Daily or Weekly
      frequency = "Daily",
      #(Required) The time of day to perform the backup in 24hour format
      time = "23:00"
    }
    retention_daily               = { count = 10 } #Required, if backup frequency set to Daily
    retention_weekly              = null           #Required, if backup frequency set to Weekly
    retention_monthly             = null
    retention_yearly              = null
    timezone                      = null
    azurerm_backup_policy_vm_tags = { automated_by = "Ploceus_Terraform" }
  }
}
