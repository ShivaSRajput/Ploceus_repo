resource "azurerm_backup_policy_vm" "backup_policy_vm" {
  for_each            = var.azurerm_backup_policy_vm
  name                = each.value.name                                           #Required
  resource_group_name = each.value.resource_group_name                            #Required
  recovery_vault_name = each.value.recovery_vault_name                            #Required
  timezone            = each.value.timezone == null ? "UTC" : each.value.timezone #Optional

  backup { #Required
    frequency = each.value.backup.frequency
    time      = each.value.backup.time
  }

  dynamic "retention_daily" { #Required, if backup frequency set to daily
    for_each = each.value.backup.frequency == "Daily" ? (each.value.retention_daily == null ? [] : [true]) : []
    #for_each = coalesce(lookup(each.value, "retention_daily"), "") == true ? [true] : []
    content {
      count = each.value.retention_daily.count
    }
  }

  dynamic "retention_weekly" { #Required, if backup frequency set to weekly
    for_each = each.value.backup.frequency == "Weekly" ? (each.value.retention_weekly == null ? [] : [true]) : []
    content {
      count    = each.value.retention_weekly.count
      weekdays = each.value.retention_weekly.weekdays
    }
  }

  dynamic "retention_monthly" { #Optional
    for_each = each.value.retention_monthly == null ? [] : [true]
    content {
      count    = each.value.retention_monthly.count
      weekdays = each.value.retention_monthly.weekdays
      weeks    = each.value.retention_monthly.weeks
    }
  }

  dynamic "retention_yearly" { #Optional
    for_each = each.value.retention_yearly == null ? [] : [true]
    content {
      count    = each.value.retention_yearly.count
      weekdays = each.value.retention_yearly.weekdays
      weeks    = each.value.retention_yearly.weeks
      months   = each.value.retention_yearly.months
    }
  }

  tags = each.value.azurerm_backup_policy_vm_tags #Required
}
