#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Private DNS Zone
module "private_dns_zones" {
  source            = "../../../private_dns_zone/v1.0.0"
  private_dns_zones = var.private_dns_zones
  depends_on = [
    module.resource_group
  ]
}

#Private DNS Zone TXT Record
module "private_dns_zone_txt_record" {
  source                       = "../"
  private_dns_zone_txt_records = var.private_dns_zone_txt_records
  depends_on = [
    module.resource_group,
    module.private_dns_zones
  ]
}
