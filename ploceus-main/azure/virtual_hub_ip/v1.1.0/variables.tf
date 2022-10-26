#Virtual Hub IP Variables
variable "virtual_hub_ip_variables" {
  type = map(object({
    name                         = string
    subnet_name                  = string
    vnet_name                    = string
    resource_group_name          = string
    private_ip_address           = string
    private_ip_allocation_method = string
    public_ip_address_name       = string
    virtual_hub_name             = string
  }))
  description = "Virtual Hub IP Values"
}