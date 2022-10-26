#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on = [
    module.resource_group
  ]
}

#Subnet
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#Route Table
module "route_table" {
  source                = "../../../route_table/v1.1.0"
  route_table_variables = var.route_table_variables
  depends_on = [
    module.resource_group
  ]
}

# Subnet -> Route Table Association
module "subnet_route_table_association" {
  source                                   = "../"
  subnet_route_table_association_variables = var.subnet_route_table_association_variables
  depends_on = [
    module.resource_group,
    module.route_table,
    module.subnet
  ]
}