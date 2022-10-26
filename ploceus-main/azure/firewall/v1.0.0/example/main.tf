#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on       = [module.resource_group]
  #depends_on = [module.ddos_protection_plan]  #Uncomment if the ddos protection plan is required
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#FIREWALL
module "firewall" {
  source                     = "../"
  firewall_variables = var.firewall_variables
  depends_on       = [module.vnet, module.subnet]
}
