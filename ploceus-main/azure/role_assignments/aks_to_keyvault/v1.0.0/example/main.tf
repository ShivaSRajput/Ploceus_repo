#AKS
module "aks" {
  source                = "../../../../aks/v1.0.0"
  aks_cluster_variables = var.aks_cluster_variables
}

#Key Vault
module "key_vault" {
  source              = "../../../../key_vault/v1.0.0"
  key_vault_variables = var.key_vault_variables
}

#ROLE ASSIGNMENT
module "aks_to_keyvault_role_assignment" {
  source                                 = "../"
  aks_keyvault_role_assignment_variables = var.aks_keyvault_role_assignment_variables
  # aks_principal_id                       = module.aks.aks_principle_id[0]
  aks_principal_id = module.aks.aks_principle_id.aks_principle_id[0]
  depends_on = [module.aks,
    module.key_vault
  ]
}
