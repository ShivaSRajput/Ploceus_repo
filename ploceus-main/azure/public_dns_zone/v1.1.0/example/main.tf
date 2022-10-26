#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}


#DNS Zone
module "public_dns_zone" {
  source            = "../"
  public_dns_zone_variable = var.public_dns_zone_variable
  depends_on        = [module.resource_group]
}