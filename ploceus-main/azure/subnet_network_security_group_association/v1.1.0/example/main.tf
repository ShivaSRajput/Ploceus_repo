module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

# VNET
module "virtual_network" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.virtual_network]
}

module "network_security_group" {
  source                          = "../../../network_security_group/v1.1.0"
  network_security_group_variable = var.network_security_group_variable
  depends_on                      = [module.subnet]
}

module "subnet_nsg_association" {
  source                    = "../"
  nsg_association_variables = var.nsg_association_variables
  depends_on = [
    module.network_security_group
  ]
}


