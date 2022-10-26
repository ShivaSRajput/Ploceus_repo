variable "vpn_server_configuration_policy_group_variables" {
  type = map(object({
    name                          = string
    vpn_server_configuration_id   = string
    is_default                    = bool
    priority                      = number
  
    policy = list(object({
      name                        = string
      type                        = string #Possible values are AADGroupId, CertificateGroupId and RadiusAzureGroupId
      value                       = string
    }))
  }))
}



