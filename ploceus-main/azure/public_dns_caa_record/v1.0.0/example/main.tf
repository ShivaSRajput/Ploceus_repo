#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Private DNS Zone
module "public_dns_zones" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on = [
    module.resource_group
  ]
}

#Public DNS Zone caa Record
module "public_dns_zone_caa_record" {
  source                       = "../"
  public_dns_zone_caa_records = var.public_dns_zone_caa_records
  depends_on = [
    module.resource_group,
    module.public_dns_zones
  ]
}