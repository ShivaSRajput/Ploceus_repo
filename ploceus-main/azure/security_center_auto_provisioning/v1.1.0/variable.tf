variable "security_center_auto_provisioning_variables" {
  type = map(object({
    auto_provision = string
  }))
}