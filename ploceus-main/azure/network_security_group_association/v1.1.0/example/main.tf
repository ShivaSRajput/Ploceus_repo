#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

# VNET
module "virtual_network" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#SUBNET
module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.virtual_network]
}

#Public IP
module "public_ip" {
  source             = "../../../public_ip/v1.1.0"
  public_ip_variables = var.public_ip_variables
  depends_on         = [module.resource_group]
}

#LINUX VMs
module "linux_vm" {
  source                          = "../../../linux_virtual_machine/v1.0.0"
  linux_virtual_machine_variables = {}
  linux_vm_nic_variables          = var.nic_variables
  depends_on                      = [module.subnet, module.public_ip]
}

#Network Security Group
module "network_security_group" {
  source                          = "../../../network_security_group/v1.1.0"
  network_security_group_variable = var.network_security_group_variable
  depends_on                      = [module.resource_group]
}

#Network Security Group Association
module "nsg_association" {
  source                   = "../"
  network_security_group_association  = var.network_security_group_association
  depends_on               = [module.network_security_group, module.subnet, module.public_ip, module.linux_vm ]
}
