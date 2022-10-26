variable "security_center_auto_provisioning_variables" {
  type = map(object({
    auto_provision = string  #Possible values are On (to install the security agent automatically, if it's missing) or Off (to not install the security agent automatically).
  }))
}
