#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#DNS Zone
module "public_dns_zone" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on        = [module.resource_group]
}

#Public DNS Zone CNAME Record and ALIAS CNAME record
module "public_dns_zone_cname_record" {
  source                       = "../"
  public_dns_zone_cname_records = var.public_dns_zone_cname_records
    depends_on = [
    module.resource_group,
    module.public_dns_zone
  ]
}