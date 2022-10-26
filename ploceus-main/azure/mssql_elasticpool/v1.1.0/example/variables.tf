# Resource Group
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

# MSSQL Server
variable "mssql_servers_variables" {
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

# MSSQL Elastic pool
variable "mssql_elasticpool_variables" {
  type = map(object({
    mssql_elasticpool_name                = string #Required
    mssql_elasticpool_resource_group_name = string #Required
    mssql_elasticpool_location            = string #Required
    mssql_elasticpool_server_name         = string #Required
    mssql_elasticpool_license_type        = string #Optional  Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice.
    mssql_elasticpool_max_size_gb         = number #Optional  The max data size of the elastic pool in gigabytes. Conflicts with max_size_bytes. 
    mssql_elasticpool_max_size_bytes      = number #Optional The max data size of the elastic pool in bytes. Conflicts with max_size_gb.
    mssql_elasticpool_zone_redundant      = bool   #Optional  Whether or not this elastic pool is zone redundant. tier needs to be Premium for DTU based or BusinessCritical for vCore based sku. Defaults to false.
    mssql_elasticpool_sku = object({
      sku_name     = string #Required
      sku_tier     = string #Required 
      sku_family   = string #Optional The family of hardware Gen4, Gen5, Fsv2 or DC.
      sku_capacity = number #Required
    })

    mssql_elasticpool_per_database_settings = object({
      min_capacity = number #Required
      max_capacity = number #Required
    })
    mssql_elasticpool_tags = map(string) #Optional  A mapping of tags to assign to the resource.
  }))
  description = "variable for mssql elasticpool details"
  default     = {}
}