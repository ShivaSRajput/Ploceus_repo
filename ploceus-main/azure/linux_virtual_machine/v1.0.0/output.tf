output "linux_virtual_machine_outputs" {
  value = [
    for k, v in var.linux_virtual_machine_variables :
    {
      virtual_machine_id   = azurerm_linux_virtual_machine.linux_virtual_machine[k].virtual_machine_id
      private_ip_addresses = azurerm_linux_virtual_machine.linux_virtual_machine[k].private_ip_addresses
      public_ip_addresses  = azurerm_linux_virtual_machine.linux_virtual_machine[k].public_ip_addresses
    }
  ]
  description = "Linux virtual machine output values"
}