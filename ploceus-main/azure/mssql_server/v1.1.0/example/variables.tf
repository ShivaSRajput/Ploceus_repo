variable "mssql_servers" {
  type = map(object({
    name                                 = string
    location                             = string
    resource_group_name                  = string
    version                              = string
    administrator_login                  = string
    administrator_login_password         = string
    connection_policy                    = string
    minimum_tls_version                  = number
    public_network_access_enabled        = bool
    outbound_network_restriction_enabled = bool
    primary_user_assigned_identity_id    = string
    tags                                 = map(string)
    identity = object({
      type         = string
      identity_ids = list(string)
    })
    azuread_administrator = object({
      login_email                 = string
      object_id                   = string
      tenant_id                   = string
      azuread_authentication_only = bool
    })
  }))
  description = "variable for sql server details"
  default     = {}
}