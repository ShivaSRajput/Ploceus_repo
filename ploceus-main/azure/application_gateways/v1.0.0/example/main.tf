#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}


# VNET FOR AKS
module "vnet" {
  source          = "../../../vnet/v1.0.0"
  vnets_variables = var.vnets_variables
  #depends_on = [module.ddos_protection_plan]
}

#SUBNET FOR AKS
module "subnet" {
  source           = "../../../subnet/v1.0.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#Public IP
module "public_ip" {
  source             = "../../../public_ip/v1.0.0"
  public_ip_variable = var.public_ip_variable
}

#APPLICATION GATEWAY
module "application_gateway" {
  source                        = "../"
  application_gateway_variables = var.application_gateway_variables
  depends_on = [module.vnet,
    module.subnet,
    module.public_ip,
  ]
}
