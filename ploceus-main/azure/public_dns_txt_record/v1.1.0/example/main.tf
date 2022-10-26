#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

module "public_dns_zone" {
  source            = "../../../public_dns_zone/v1.0.0"
  dns_zone_variable = var.dns_zone_variable
  depends_on = [
    module.resource_group
  ]
}

#Pubic DNS Zone TXT Record
module "public_dns_txt_record" {
  source                       = "../"
  azurerm_dns_zone_txt_records = var.azurerm_dns_zone_txt_records
  depends_on = [
    module.resource_group,
    module.public_dns_zone
  ]
}
