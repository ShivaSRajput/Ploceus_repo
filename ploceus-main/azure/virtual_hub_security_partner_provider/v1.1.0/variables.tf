#Virtual Hub Security Partner Provider
variable "virtual_hub_security_partner_provider_variables" {
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    virtual_hub_name       = string
    security_provider_name = string #Only allowed ZScaler, IBoss and Checkpoint
    tags                   = map(string)
  }))
}