module "pls" {
  source            = "../"
  private_endpoints = var.private_endpoints
  vnets_variables   = var.vnets_variables
  subnet_variables  = var.subnet_variables
  # keyvault_name         = var.keyvault_name
  # keyvault_resourcegroup= var.keyvault_resourcegroup
}
