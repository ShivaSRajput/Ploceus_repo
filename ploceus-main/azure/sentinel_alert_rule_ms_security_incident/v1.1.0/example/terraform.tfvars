#RESOURCE GROUP 
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
#sentinel alert rule ms security incident variables
sentinel_alert_rule_ms_security_incident_variables = {
  "sentinel_alert_rule_ms_security_incident_1" = {
    log_analytics_workspace_name                  = "ploceuslaw000001"
    log_analytics_workspace_resource_group_name   = "ploceusrg000001"
    sentinel_alert_rule_ms_security_incident_name = "ploceussentinelalertrulesecurityincident000001"
    display_name                                  = "ploceusmssecurityincident"
    product_filter                                = "Microsoft Cloud App Security" # posiible values are Azure Active Directory Identity Protection, Azure Advanced Threat Protection, Azure Security Center, Azure Security Center for IoT, Microsoft Cloud App Security, Microsoft Defender Advanced Threat Protection and Office 365 Advanced Threat Protection.
    severity_filter                               = ["High", "Informational"]      # Possible values are High, Medium, Low and Informational.
    alert_rule_template_guid                      = "f71aba3d-28fb-450b-b192-4e76a83015c8"
    description                                   = "ploceus sentinel alert rule ms security incident"
    enabled                                       = true
    display_name_filter                           = null # Only create incidents when the alert display name contain text from this list, leave empty to apply no filter.
    display_name_exclude_filter                   = null # Only create incidents when the alert display name doesn't contain text from this list.
  }
}
