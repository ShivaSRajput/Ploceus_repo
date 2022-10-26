#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
  #depends_on = [module.ddos_protection_plan]  #Uncomment if the ddos protection plan is required
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#Public IP
module "public_ip" {
  source              = "../../../public_ip/v1.1.0"
  public_ip_variables = var.public_ip_variables
  depends_on          = [module.resource_group]
}

#FIREWALL
module "firewall" {
  source             = "../../../firewall/v1.0.0"
  firewall_variables = var.firewall_variables
  depends_on         = [module.vnet, module.subnet]
}

#FIREWALL_APPLICATION_RULE_COLLECTION
module "firewall_app_rule_collection" {
  source                                         = "../"
  firewall_application_rule_collection_variables = var.firewall_application_rule_collection_variables
  depends_on                                     = [module.resource_group, module.firewall]
}