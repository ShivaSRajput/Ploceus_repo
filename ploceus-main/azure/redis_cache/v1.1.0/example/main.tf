#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "vnet" {
  source          = "../../../vnet/v1.0.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

module "subnet" {
  source           = "../../../subnet/v1.0.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#Redis_Cache
module "redis_cache" {
  source                = "../"
  redis_cache_variables = var.redis_cache_variables
  depends_on            = [module.resource_group, module.subnet]
}