#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Public DNS Zone
module "public_dns_zone" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on = [
    module.resource_group
  ]
}

#Public DNS Zone SRV Record
module "public_dns_srv_record" {
  source                       = "../"
  dns_zone_srv_records = var.dns_zone_srv_records
  depends_on = [
    module.resource_group,
    module.public_dns_zone
  ]
}