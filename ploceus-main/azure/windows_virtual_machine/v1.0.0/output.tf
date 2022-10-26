output "windows_virtual_machine_outputs" {
  value = [
    for k, v in var.windows_virtual_machine_variables :
    {
      virtual_machine_id   = azurerm_windows_virtual_machine.windows_virtual_machine[k].virtual_machine_id
      private_ip_addresses = azurerm_windows_virtual_machine.windows_virtual_machine[k].private_ip_addresses
      public_ip_addresses  = azurerm_windows_virtual_machine.windows_virtual_machine[k].public_ip_addresses
    }
  ]
  description = "windows virtual machine output values"
}
