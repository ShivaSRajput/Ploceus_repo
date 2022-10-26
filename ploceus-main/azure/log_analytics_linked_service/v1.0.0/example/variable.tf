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

#AUTOMATION ACCOUNT VARIABLES
variable "automation_account_variables" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    sku_name                = string
    automation_account_tags = map(string)
    identity_type           = string
    user_identity_name      = string
  }))
}

#LOG ANALYTICS WORKSPACE VARIABLE
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

#LOG ANALYTICS LINKED SERVICE VARIABLES
variable "log_analytics_linked_service_variables" {
  type = map(object({
    resource_group_name               = string
    location                          = string
    automation_account_name           = string
    sku_name                          = string
    log_analytics_workspace_name      = string
    sku                               = string
    law_retention_in_days             = string # Log Analytics WOrkspace Retention in days
  }))
}