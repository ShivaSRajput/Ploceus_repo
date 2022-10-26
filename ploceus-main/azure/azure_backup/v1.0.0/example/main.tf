#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Recovery Service Vault
module "recoveryservicevault" {
  source                          = "../../../recovery_services_vault/v1.0.0"
  recovery_service_vault_variable = var.recovery_service_vault_variable
  depends_on                      = [module.resource_group]
}

#BACKUP POLICY
module "backup_policy" {
  source                   = "../"
  azurerm_backup_policy_vm = var.azurerm_backup_policy_vm
  depends_on               = [module.recoveryservicevault]
}

