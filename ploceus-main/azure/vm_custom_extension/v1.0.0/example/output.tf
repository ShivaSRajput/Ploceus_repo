output "VM_Extension_details" {
  value      = module.virtual_machine_extension.VM_Extension_details
  depends_on = [module.virtual_machine_extension]
}