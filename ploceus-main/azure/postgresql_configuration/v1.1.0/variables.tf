#Postgresql configuration VARIABLES
variable "postgresql_configuration_variables" {
  type = map(object({
    postgresql_configuration_name                = string
    postgresql_configuration_resource_group_name = string
    postgresql_configuration_server_name         = string
    postgresql_configuration_value               = string
  }))
}
