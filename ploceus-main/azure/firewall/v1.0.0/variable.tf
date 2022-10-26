variable "firewall_variables" {
  type = map(object({
    name                                             = string
    resource_group_name                              = string
    location                                         = string
    vnet_name                                        = string
    subnet_name                                      = string
    sku_name                                         = string
    sku_tier                                         = string
    zones                                            = list(string)
    policy_id                                        = string
    dns_servers                                      = list(string)
    private_ip_ranges                                = list(string)
    management_ip_enabled                            = bool
    management_ip_configuration_name                 = string
    management_ip_configuration_subnet_id            = string
    management_ip_configuration_public_ip_address_id = string
    threat_intel_mode                                = string
    virtual_hub_enabled                              = bool
    virtual_hub_id                                   = string
    public_ip_count                                  = number
    tags                                             = map(string)
    additional_public_ips = list(object({
      ip_configuration_name  = string
      public_ip_address_name = string
      subnet_name            = string
      vnet_name              = string
      resource_group_name    = string
    }))
  }))
}
