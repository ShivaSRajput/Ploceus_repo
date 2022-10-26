variable "advanced_threat_protection_variables" {
  type = map(object({
    enabled                    = bool
    target_resource_name       = string
    target_resource_group_name = string
  }))
}
