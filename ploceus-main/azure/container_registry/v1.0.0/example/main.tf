#RESOURCE GROUP

module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#CONTAINER REGISTRY

module "container_registry" {
  source                       = "../"
  container_registry_variables = var.container_registry_variables
  depends_on = [
    module.resource_group
  ]
}
