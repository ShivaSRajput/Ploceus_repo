# Resource Group
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

# MSSQL Server
mssql_servers_variables = {
  "mssql_servers_1" = {
    administrator_login                  = "saadmin"
    administrator_login_password         = "Password"
    connection_policy                    = "Default"
    location                             = "westus2"
    minimum_tls_version                  = 1.2
    name                                 = "ploceusmssql000001"
    outbound_network_restriction_enabled = false
    primary_user_assigned_identity_id    = null
    public_network_access_enabled        = true
    resource_group_name                  = "ploceusrg000001"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    version = "12.0"
    azuread_administrator = {
      login_email                 = "xxxxxxxxxx@ploceus.com"
      object_id                   = "00000000-0000-0000-0000-000000000000"
      tenant_id                   = "00000000-0000-0000-0000-000000000000"
      azuread_authentication_only = true
    }
    identity = {
      type         = "SystemAssigned"
      identity_ids = [null]
    }
  }
}

# MSSQL Elasticpool 
mssql_elasticpool_variables = {
  "mssql_elasticpool_1" = {
    mssql_elasticpool_name                = "ploceusmssqlep000001"
    mssql_elasticpool_resource_group_name = "ploceusrg000001"
    mssql_elasticpool_location            = "westus2"
    mssql_elasticpool_server_name         = "ploceusmssql000001"
    mssql_elasticpool_license_type        = "LicenseIncluded"
    mssql_elasticpool_max_size_gb         = 100
    mssql_elasticpool_max_size_bytes      = null #One of either max_size_gb or max_size_bytes must be specified.
    mssql_elasticpool_zone_redundant      = false
    mssql_elasticpool_sku = {
      sku_name     = "GP_Gen5"
      sku_tier     = "GeneralPurpose"
      sku_family   = "Gen5"
      sku_capacity = 4
    }
    mssql_elasticpool_per_database_settings = {
      min_capacity = 1
      max_capacity = 4
    }
    mssql_elasticpool_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
