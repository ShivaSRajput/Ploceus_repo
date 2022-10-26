variable "security_center_setting_variables" {
  type = map(object({
    setting_name = string
    enabled      = bool
  }))
}
