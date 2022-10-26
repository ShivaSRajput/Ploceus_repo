key_vault_key_variables = {
  "key_vault_key_1" = {
    name                = "ploceuskeyavaultkey000001a"
    resource_group_name = "ploceusrg000001"
    key_vault_name      = "ploceuskeyvault000001a"
    key_type            = "RSA"
    key_size            = 2048
    curve               = null
    key_opts            = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
    not_before_date     = null
    expiration_date     = null
    key_vault_key_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}