#Resource Group
module "resource_group" {
  providers = {
    azurerm = azurerm.virtual_hub_sub
  }
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  providers = {
    azurerm = azurerm.virtual_hub_sub
  }
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#Virtual WAN
module "virtual_wan" {
  providers = {
    azurerm = azurerm.virtual_hub_sub
  }
  source                = "../../../virtual_wan/v1.1.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on            = [module.resource_group, module.vnet]
}

#Virtual Hub
module "virtual_hub" {
  providers = {
    azurerm = azurerm.virtual_hub_sub
  }
  source                = "../../../virtual_hub/v1.1.0"
  virtual_hub_variables = var.virtual_hub_variables
  depends_on            = [module.resource_group, module.vnet, module.virtual_wan]
}

#Virtual Hub Connection
module "virtual_hub_connection" {
  providers = {
    azurerm.virtual_hub_sub = azurerm.virtual_hub_sub
    azurerm.vnet_sub        = azurerm.vnet_sub
  }
  source                           = "../"
  virtual_hub_connection_variables = var.virtual_hub_connection_variables
  depends_on                       = [module.resource_group, module.vnet, module.virtual_wan, module.virtual_hub]
}

