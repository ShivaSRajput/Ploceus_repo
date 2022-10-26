
# FIREWALL POLICY RULE COLLECTION GROUP VARIABLES
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

#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#FIREWALL POLICY VARIABLES
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

#LOG ANALYTICS WORKSPACE VARIABLES
variable "log_analytics_workspace_variables" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    sku                                = string
    retention_in_days                  = number
    daily_quota_gb                     = number
    internet_ingestion_enabled         = bool
    internet_query_enabled             = bool
    reservation_capacity_in_gb_per_day = number
    log_analytics_workspace_tags       = map(string)
  }))
}
