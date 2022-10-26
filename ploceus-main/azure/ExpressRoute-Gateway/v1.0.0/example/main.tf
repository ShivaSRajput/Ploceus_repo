#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

# #VNET
# module "vnet" {
#   source          = "../../../vnet/v1.0.0"
#   vnets_variables= var.vnets_variables
#    #depends_on      = [module.resource_group]
# }

#VIRTUALHUB
module "virtual_hub" {
  source                   = "../../../vitrual_hub/v1.0.0"
  virtual_hub_variables    =  var.virtual_hub_variables
 depends_on               = [module.virtual_wan,
 module.resource_group]
}

 #VIRTUALWAN
 module "virtual_wan" {
   source                = "../../../virtual_wan/v1.0.0"
   virtual_wan_variables =  var.virtual_wan_variables
  depends_on            = [module.resource_group]
 }


module "express_route_gateway" {
  source         = "../"
  express_route_gateway = var.express_route_gateway
  virtual_hub_variables = var.virtual_hub_variables
  virtual_wan_variables = var.virtual_wan_variables
  depends_on     = [module.resource_group, module.virtual_hub, module.virtual_wan]
}


