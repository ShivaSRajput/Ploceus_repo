#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#KEY VAULT
module "key_vault" {
  source              = "../../../key_vault/v1.0.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}


#KEY VAULT KEY
module "key_vault_key" {
  source                  = "../../../key_vault_key/v1.0.0"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault]
}

#DISK ENCRYPTION SET
module "disk_encryption_set" {
  source                        = "../"
  disk_encryption_set_variables = var.disk_encryption_set_variables
  depends_on                    = [module.key_vault_key]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  for_each                          = var.disk_encryption_set_variables
  source                            = "../../../key_vault_access_policy/kvac(diskencryption_set)/v1.0.0"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  disk_encryption_set_key           = each.key
  tenant_id                         = module.disk_encryption_set.disk_encryption_set_tenant_id[each.key][0]
  object_id                         = module.disk_encryption_set.disk_encryption_set_principal_id[each.key][0]
  depends_on                        = [module.disk_encryption_set]
}




