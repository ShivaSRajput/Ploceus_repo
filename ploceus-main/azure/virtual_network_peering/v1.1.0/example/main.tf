#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.source_vnet_sub 
   }
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  providers = {
    azurerm = azurerm.source_vnet_sub 
   }
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#Vnet_peering
module "virtual_network_peering" {
  source = "../"
  providers = {
    azurerm.source_vnet_sub = azurerm.source_vnet_sub
    azurerm.dest_vnet_sub   = azurerm.dest_vnet_sub
  }
  virtual_network_peering_variables = var.virtual_network_peering_variables
  depends_on                        = [module.resource_group, module.vnet]
}

