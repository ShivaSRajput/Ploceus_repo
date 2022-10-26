#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}


#Virtual Hub
module "virtual_hub" {
  source                = "../../../virtual_hub/v1.1.0"
  virtual_hub_variables = var.virtual_hub_variables
    depends_on = [
    module.resource_group,
    module.subnet
  ]
}

#Public IP
module "public_ip" {
  source              = "../../../public_ip/v1.1.0"
  public_ip_variables = var.public_ip_variables
  depends_on          = [module.resource_group]
}

#Vnet
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


#Virtual Hub IP
module "virtual_hub_ip" {
  source                   = "../"
  virtual_hub_ip_variables = var.virtual_hub_ip_variables
  depends_on = [
    module.virtual_hub,
    module.public_ip
  ]
}
