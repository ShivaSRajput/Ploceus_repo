# Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

# MSSQL Server
module "mssql_servers" {
  source        = "../../../mssql_server/v1.1.0"
  mssql_servers = var.mssql_servers_variables
  depends_on    = [module.resource_group]
}

# MSSQL Elastic pool
module "mssql_elasticpool" {
  source                      = "../"
  mssql_elasticpool_variables = var.mssql_elasticpool_variables
  depends_on = [
    module.resource_group,
    module.mssql_servers
  ]
}