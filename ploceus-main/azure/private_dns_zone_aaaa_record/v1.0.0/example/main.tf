#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}


#PRIVATE DNS ZONE
module "private_dns_zones" {
  source            = "../../../private_dns_zone/v1.0.0"
  private_dns_zones = var.private_dns_zones
  depends_on = [
    module.resource_group
  ]
}

#Private DNS Zone AAAA Record
module "private_dns_zone_aaaa_record" {
  source                       = "../"
  private_dns_zone_aaaa_records = var.private_dns_zone_aaaa_records
  depends_on = [
    module.resource_group,
    module.private_dns_zones
  ]
}