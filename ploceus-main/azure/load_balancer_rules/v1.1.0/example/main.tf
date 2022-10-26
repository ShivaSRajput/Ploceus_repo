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
  depends_on       = [module.vnet]
}

module "loadbalancer" {
  source                   = "../../../load_balancer/v1.1.0"
  load_balancers_variables = var.load_balancers_variables
  depends_on               = [module.resource_group, module.vnet, module.subnet]
}

module "load_balancer_probe" {
  source                        = "../../../lb_probe/v1.1.0"
  load_balancer_probe_variables = var.load_balancer_probe_variables
  depends_on                    = [module.resource_group, module.vnet, module.subnet, module.loadbalancer]
}

module "load_balancer_backendpools" {
  source                              = "../../../load_balancer_backendpool/v1.1.0"
  load_balancer_backendpool_variables = var.load_balancer_backendpool_variables
  depends_on                          = [module.loadbalancer, module.resource_group, module.vnet, module.subnet]
}

module "loadbalancer_rules" {
  source                       = "../"
  load_balancer_rule_variables = var.load_balancer_rule_variables
  depends_on                   = [module.loadbalancer, module.resource_group, module.vnet, module.subnet, module.load_balancer_backendpools]
}

