#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}


#VIRTUAL WAN
module "private_dns_zones" {
  source            = "../"
  private_dns_zones = var.private_dns_zones
  depends_on = [
    module.resource_group
  ]
}
