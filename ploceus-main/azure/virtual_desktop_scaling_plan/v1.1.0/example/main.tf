#RESOURCE GROUP for windows VMs
module "virtual_desktop_scaling_plans" {
  source                         = "../"
  desktop_scaling_plan_variables = var.desktop_scaling_plan_variables
  depends_on = [
    module.virtual_desktop_host_pool
  ]
}

#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

# VIRTUAL DESKTOP HOST POOL
module "virtual_desktop_host_pool" {
  source                      = "../../../virtual_desktop_host_pool/v1.1.0"
  desktop_host_pool_variables = var.desktop_host_pool_variables
  depends_on                  = [module.resource_group]
}