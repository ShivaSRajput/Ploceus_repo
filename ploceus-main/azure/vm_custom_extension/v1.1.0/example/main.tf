#VIRTUAL_MACHINE_CUSTOM_EXTENSION
module "virtual_machine_extension" {
  source                              = "../"
  virtual_machine_extension_variables = var.virtual_machine_extension_variables
}