disk_encryption_set_variables = {
  "disk_encryption_set_1" = {
    name                      = "ploceusdes000001a1"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    key_vault_name            = "ploceuskeyvault000001a"
    key_vault_key_name        = "ploceuskey000001a1"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = null #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}  