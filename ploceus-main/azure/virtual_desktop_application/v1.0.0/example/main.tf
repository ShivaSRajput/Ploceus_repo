#RESOURCE GROUP for windows VMs
module "virtual_desktop_application" {
  source       = "../"
  applications = var.applications
}

