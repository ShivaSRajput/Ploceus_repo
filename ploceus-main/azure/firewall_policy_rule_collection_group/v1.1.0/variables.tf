variable "firewall_policy_rule_collection_group_variables" {
  description = "Azure Firewall Policy Rule Collection Group"
  default = {

  }
  type = map(object({
    firewall_policy_rule_collection_group_resource_group_name = string
    firewall_policy_rule_collection_group_name                = string
    priority                                                  = number
    firewall_policy_name                                      = string
    application_rule_collection = list(object({
      name     = string
      action   = string
      priority = number
      rule = list(object({
        name                  = string
        description           = string
        source_addresses      = list(string)
        source_ip_groups      = list(string)
        destination_addresses = list(string)
        destination_urls      = list(string)
        destination_fqdns     = list(string)
        destination_fqdn_tags = list(string)
        terminate_tls         = bool
        web_categories        = list(string)
        protocols = list(object(
          {
            type = string
            port = number
          }
        ))
      }))

    }))
    network_rule_collection = list(object({
      name     = string
      action   = string
      priority = number
      rule = list(object({
        name                  = string
        protocols             = list(string)
        destination_ports     = list(string)
        source_addresses      = list(string)
        source_ip_groups      = list(string)
        destination_addresses = list(string)
        destination_ip_groups = list(string)
        destination_fqdns     = list(string)

      }))
    }))
    nat_rule_collection = list(object({
      name     = string
      action   = string
      priority = number
      rule = list(object({
        name                = string
        protocols           = list(string)
        destination_ports   = list(string)
        source_addresses    = list(string)
        source_ip_groups    = list(string)
        destination_address = string
        translated_address  = string
        translated_fqdn     = string
        translated_port     = string
      }))
    }))

    }

    )
  )
}
