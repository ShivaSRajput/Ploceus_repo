#AZURE FRONT DOOR  CLUSTER
module "azure_front_door" {
  source                     = "../"
  azure_front_door_variables = var.azure_front_door_variables
  depends_on = [module.vnet,
    module.subnet
  ]
}
