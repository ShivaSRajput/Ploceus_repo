#RESOURCE GROUP for windows VMs
module "host_pool_scaling_plan" {
  source        = "../"
  scaling_plans = var.scaling_plans
}

