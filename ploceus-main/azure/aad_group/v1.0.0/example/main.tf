# VNET FOR AKS
module "azure_ad_group" {
  source                   = "../../../aad_group/v1.0.0"
  azure_ad_group_variables = var.azure_ad_group_variables
  #depends_on = [module.ddos_protection_plan]
}
