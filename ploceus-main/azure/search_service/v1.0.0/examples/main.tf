
#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

module "search_service" {
  source         = "../"
  search_service = var.search_service
  tags           = var.tags
  depends_on     = [module.resource_group]

}

module "pls" {
  source            = "../../../private_endpoint/v1.0.0"
  private_endpoints = var.private_endpoints
  vnets_variables   = var.vnets_variables
  subnet_variables  = var.subnet_variables
  # keyvault_name         = var.keyvault_name
  # keyvault_resourcegroup= var.keyvault_resourcegroup
}
