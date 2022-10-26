#MONITOR SCHEDULED QUERY RULES LOG VARIABLE
variable "monitor_scheduled_query_rules_log_variables" {
  type = map(object({
    location                               = string
    name                                   = string
    workspace_name                         = string
    metric_name                            = string
    dimension_name                         = string
    dimension_operator                     = string
    dimension_values                       = list(string)
    resource_group_name                    = string
    description                            = string
    enabled                                = bool
    monitor_scheduled_query_rules_log_tags = map(string)
  }))
}