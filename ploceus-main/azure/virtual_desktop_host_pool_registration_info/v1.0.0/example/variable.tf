#windows virtual_desktop_host_pool_registration_info Variable
variable "hostpool_reginfo_variables" {
  type = map(object({
    expiration_time = string #"2022-01-01T23:40:52Z"
    host_pool_name  = string
  }))
}
