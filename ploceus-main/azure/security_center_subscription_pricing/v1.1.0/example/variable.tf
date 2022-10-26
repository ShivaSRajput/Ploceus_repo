variable "security_center_subscription_pricing_variables" {
  type = map(object({
    tier          = string
    resource_type = string
  }))
}
