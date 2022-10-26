#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.0.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.0.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

module "loadbalancer" {
  source         = "../../../load_balancer/v1.0.0"
  load_balancers = var.load_balancers
  depends_on     = [module.resource_group, module.vnet, module.subnet]
}

module "load_balancer_backendpools" {
  source                     = "../../../load_balancer_backendpool/v1.0.0"
  load_balancer_backendpools = var.load_balancer_backendpools
  depends_on                 = [module.loadbalancer]
}

module "loadbalancer_rules" {
  source              = "../"
  load_balancer_rules = var.load_balancer_rules
  depends_on          = [module.load_balancer_backendpools]
}
