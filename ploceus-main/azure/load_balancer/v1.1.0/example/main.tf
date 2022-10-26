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
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.resource_group, module.vnet]
}


module "loadbalancer" {
  source                   = "../"
  load_balancers_variables = var.load_balancers_variables
  depends_on               = [module.resource_group, module.vnet, module.subnet, module.public_ip]
}

module "public_ip" {
  source              = "../../../public_ip/v1.1.0"
  public_ip_variables = var.public_ip_variables
  depends_on          = [module.resource_group]
}
