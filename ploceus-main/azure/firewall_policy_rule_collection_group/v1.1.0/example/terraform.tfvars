#RESOURCE GROUP VARIABLES
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
#LOG ANALYTICS WORKSPACE
log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    name                               = "ploceuslaw000001" #Required
    location                           = "westus2"          #Required
    resource_group_name                = "ploceusrg000001"  #Required
    sku                                = "PerGB2018"        #Optional
    retention_in_days                  = null               #Optional
    daily_quota_gb                     = null               #Optional
    internet_ingestion_enabled         = null               #Optional
    internet_query_enabled             = null               #Optional
    reservation_capacity_in_gb_per_day = null               #Optional
    log_analytics_workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#FIREWALL POLICY VARIABLES
firewall_policy_variables = {
  "firewall_policy_1" = {
    name                = "ploceusfp000001"
    resource_group_name = "ploceusrg000001"
    location            = "westus2"
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
      default_log_analytics_workspace_name = "ploceuslaw000001"
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
        name                  = "ploceusfp00003"
        protocol              = "TCP"
        description           = "firewall policy"
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
      created_by = "ploceus",
      department = "cis"
    }
    threat_intelligence_allowlist = {
      fqdns        = ["test.io"]
      ip_addresses = ["10.0.0.1"]
    }
    tls_certificate = {
      name                = "ploceusfp00004"
      key_vault_secret_id = "ploceusfp00005"
    }
  }


}

# # FIREWALL POLICY RULE COLLECTION GROUP VARIABLES
firewall_policy_rule_collection_group_variables = {
  "firewall_policy_rule_collection_group" = {
    firewall_policy_rule_collection_group_resource_group_name = "ploceusrg000001"
    firewall_policy_name                                      = "ploceusfp000001"
    firewall_policy_rule_collection_group_name                = "ploceusfprcg00001"
    priority                                                  = 500
    application_rule_collection = [{
      name     = "ploceusfprcg00002"
      action   = "Allow"
      priority = 100
      rule = [{
        name                  = "ploceusfprcg00003"
        description           = "ploceus"
        source_addresses      = ["10.0.0.1"]
        destination_fqdns     = ["*.microsoft.com"]
        source_ip_groups      = ["10.0.0.1"]
        destination_addresses = ["10.0.0.1"]
        destination_urls      = null
        destination_fqdn_tags = ["WindowsDiagnostics"]
        terminate_tls         = true
        web_categories        = ["Criminal activity"]
        protocols = [
          {
            type = "Http"
            port = 443
          }
        ]
      }]
    }]




    network_rule_collection = [{
      name     = "ploceusfprcg00004"
      priority = 400
      action   = "Deny"
      rule = [{
        name                  = "network_rule_collection1_rule1"
        protocols             = ["TCP", "UDP"]
        source_addresses      = ["10.0.0.1"]
        destination_addresses = ["192.168.1.1", "192.168.1.2"]
        destination_ports     = ["80", "1000-2000"]
        source_ip_groups      = ["10.0.0.1"]
        destination_ip_groups = ["10.0.0.1"]
        destination_fqdns     = ["*.microsoft.com"]

      }]
    }]
    nat_rule_collection = [{
      name     = "ploceusfprcg00005"
      priority = 400
      action   = "Dnat"
      rule = [{
        name                = "ploceusfprcg00006"
        protocols           = ["TCP", "UDP"]
        source_addresses    = ["10.0.0.1", "10.0.0.2"]
        destination_address = "192.168.1.1"
        destination_ports   = ["80", "1000-2000"]
        translated_address  = "192.168.0.1"
        translated_port     = "8080"
        source_ip_groups    = ["10.0.0.1"]
        translated_fqdn     = "*.microsoft.com"

      }]
    }]
  }
}