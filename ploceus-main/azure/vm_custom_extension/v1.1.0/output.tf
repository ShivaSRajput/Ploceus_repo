output "vm_extension_id" {
  value = { for k, v in azurerm_virtual_machine_extension.virtual_machine_extension : k => v.id }
}
