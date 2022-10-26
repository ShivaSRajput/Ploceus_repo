#virtual_desktop_host_pool_registration_info
module "virtual_desktop_host_pool_reg_info" {
  source              = "../"
  appGroups_variables = var.hostpool_reginfo_variables
}

