#LOG ANALYTICS LINKED SERVICE VARIABLES
variable "log_analytics_linked_service_variables" {
  type = map(object({
    resource_group_name               = string
    location                          = string
    automation_account_name           = string
    sku_name                          = string
    log_analytics_workspace_name      = string
    sku                               = string # Log Analytics Workspace SKU
    law_retention_in_days             = string # Log Analytics WOrkspace Retention in days
  }))
}