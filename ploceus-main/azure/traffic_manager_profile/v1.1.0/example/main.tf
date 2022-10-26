#RESOURCE GROUP for windows VMs
module "traffic_manager_profiles" {
  source                   = "../"
  traffic_manager_profiles = var.traffic_manager_profiles
}

