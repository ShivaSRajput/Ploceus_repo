#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
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

#Local Network Gateway
module "local_network_gateway" {
  source                          = "../../../local_network_gateway/v1.1.0"
  local_network_gateway_variables = var.local_network_gateway_variables
  depends_on                      = [module.resource_group]
}

#Public IP
module "virtual_network_gateway" {
  source             = "../"
  virtual_network_gateway_variables = var.virtual_network_gateway_variables
  depends_on         = [module.local_network_gateway,module.resource_group,module.public_ip,module.local_network_gateway,module.subnet  ]
}