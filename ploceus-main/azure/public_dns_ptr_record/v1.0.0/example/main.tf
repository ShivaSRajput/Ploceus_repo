#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#DNS Zone
module "dns_zones" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on = [
    module.resource_group
  ]
}

#Public DNS Zone PTR Record
module "dns_ptr_record" {
  source         = "../"
  dns_ptr_records = var.dns_ptr_records
  depends_on = [
    module.resource_group,
    module.dns_zones
  ]
}