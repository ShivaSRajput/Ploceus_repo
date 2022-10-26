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

#Public DNS Zone NS Record
module "dns_ns_record" {
  source         = "../"
  dns_ns_records = var.dns_ns_records
  depends_on = [
    module.resource_group,
    module.dns_zones
  ]
}