#windows virtual_desktop_host_pool_registration_info Variable
variable "desktop_host_pool_registration_info_variables" {
  type = map(object({
    expiration_time               = string #"2022-01-01T23:40:52Z"
    host_pool_name                = string
    host_pool_resource_group_name = string
  }))
}
