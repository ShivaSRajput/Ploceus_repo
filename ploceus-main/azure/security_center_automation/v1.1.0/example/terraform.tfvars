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
    name                               = "ploceuslog000001" #Required
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

security_centre_automation_variables = {
  "security_centre_automation1" = {
    name                = "ploceusseccenauto000001"
    namespace           = "eventhubns000001"
    resource_group_name = "ploceusrg000001"
    location            = "eastus2"
    scopes              = ["/subscriptions/00000000-0000-0000-0000-000000000000"]
    event_source        = "Alerts"
    property_path       = "properties.metadata.severity"
    operator            = "Equals"
    expected_value      = "High"
    property_type       = "String"
    actions = [{
      actions_type                = "LogAnalytics"
      actions_resource_name       = "ploceusloganalytics000001"
      actions_resource_group_name = "ploceusrg000001"
      actions_connection_string   = "example-connection-string"
      actions_trigger_url         = "http://sampleurl-test-loganalytics"
      actions_eventhub_namespace  = "" #To be declared only for eventhub.
      }, {
      actions_type                = "LogicApp"
      actions_resource_name       = "ploceuslogicapp000001"
      actions_resource_group_name = "ploceusrg000001"
      actions_connection_string   = "example-connection-string"
      actions_trigger_url         = "http://sampleurl-test-logicapp"
      actions_eventhub_namespace  = "" #To be declared only for eventhub.
      }, {
      actions_type                = "EventHub"
      actions_resource_name       = "ploceuseventhub000001"
      actions_resource_group_name = "ploceusrg000001"
      actions_connection_string   = "example-connection-string"
      actions_trigger_url         = "http://sampleurl-test-eventhub"
      actions_eventhub_namespace  = "ploceuseventhubns000001"
    }]
  }
}
