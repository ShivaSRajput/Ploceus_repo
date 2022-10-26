variable "firewall_policy_variables" {
  description = "Azure Firewall Policies Variable"
  default = {

  }
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    base_policy_id      = string

    dns = object({
      proxy_enabled = bool
      servers       = list(string)
    })
    identity = object({
      type = string
      ids  = list(string)
    })
    insights = object({
      enabled                              = bool
      default_log_analytics_workspace_id   = string
      default_log_analytics_workspace_name = string
      retention_in_days                    = string
      log_analytics_workspace = list(object({
        id                = string
        firewall_location = string

      }))
    })
    intrusion_detection = object({
      mode = string
      signature_overrides = list(object({
        id    = string
        state = string

      }))
      traffic_bypass = list(object({
        name                  = string
        protocol              = string
        description           = string
        destination_addresses = list(string)
        destination_ip_groups = list(string)
        destination_ports     = list(string)
        source_addresses      = list(string)
        source_ip_groups      = list(string)
      }))


    })
    private_ip_ranges = list(string)
    sku               = string
    tags              = map(string)
    threat_intelligence_allowlist = object(
      {
        fqdns        = list(string)
        ip_addresses = list(string)
      }
    )
    tls_certificate = object(
      {
        key_vault_secret_id = string
        name                = string

      }
    )

    }

    )
  )
}