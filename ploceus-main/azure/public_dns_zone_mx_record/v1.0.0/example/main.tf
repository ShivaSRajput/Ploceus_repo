#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#PUBLIC DNS Zone
module "public_dns_zones" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on = [
    module.resource_group
  ]
}

#PUBLIC DNS Zone SRV Record
module "public_dns_zone_mx_record" {
  source                       = "../"
  public_dns_zone_mx_records = var.public_dns_zone_mx_records
  depends_on = [
    module.resource_group,
    module.public_dns_zones
  ]
}
