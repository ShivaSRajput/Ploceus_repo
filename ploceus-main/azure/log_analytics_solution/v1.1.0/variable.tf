#LOG ANALYTICS SOLUTION VARIABLE
variable "log_analytics_solution_variables" {
  type = map(object({
    location                    = string
    solution_name               = string
    publisher                   = string
    product                     = string
    promotion_code              = string
    resource_group_name         = string
    workspace_name              = string
    log_analytics_solution_tags = map(string)
  }))
}