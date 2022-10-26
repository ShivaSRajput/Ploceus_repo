firewall_policy_variables = {
  "firewall_policy_1" = {
    name                = "test"
    resource_group_name = "test-rg"
    location            = "East US"
    base_policy_id      = "/subscriptions/c4f23f90-919c-4d2f-bb60-3a5c1dc705cc/resourceGroups/sample-rg/providers/Microsoft.Network/firewallPolicies/ruleCollectionGroups"

    dns = {
      proxy_enabled = false
      servers       = ["10.0.0.1"]
    }
    identity = {
      type = "UserAssigned"
      ids  = ["/subscriptions/c4f23f90-919c-4d2f-bb60-3a5c1dc705cc/resourceGroups/sample-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/ruleCollectionGroups"]
    }
    insights = {
      enabled                              = false
      default_log_analytics_workspace_id   = "/subscriptions/e9287a33-dc32-4078-a4e3-03e986c9c108/resourcegroups/test-rg/providers/microsoft.operationalinsights/workspaces/test"
      default_log_analytics_workspace_name = "test"
      retention_in_days                    = 2
      log_analytics_workspace = [
        {
          firewall_location = "eastasia"
          id                = "/subscriptions/e9287a33-dc32-4078-a4e3-03e986c9c108/resourcegroups/test-rg/providers/microsoft.operationalinsights/workspaces/test"

      }]
    }
    intrusion_detection = {
      mode = "Off"
      signature_overrides = [{
        state = "Off"
        id    = "123456789123"
      }]
      traffic_bypass = [{
        name                  = "test"
        protocol              = "TCP"
        description           = "test"
        destination_addresses = ["10.0.0.0/25"]
        destination_ip_groups = ["10.0.0.0/25"]
        destination_ports     = ["1234"]
        source_addresses      = ["10.0.0.0/25"]
        source_ip_groups      = ["10.0.0.0/25"]

      }]

    }
    private_ip_ranges = ["10.0.0.8/23"]
    sku               = "Standard"
    tags = {
      test = "test"
    }
    threat_intelligence_allowlist = {
      fqdns        = ["test.io"]
      ip_addresses = ["10.0.0.1"]
    }
    tls_certificate = {
      name                = "test"
      key_vault_secret_id = "test"
    }
  }


}