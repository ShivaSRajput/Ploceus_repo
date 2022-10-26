# MSSQL Elasticpool
resource "azurerm_mssql_elasticpool" "mssql_elasticpool" {
  for_each = var.mssql_elasticpool_variables

  name                = each.value.mssql_elasticpool_name
  resource_group_name = each.value.mssql_elasticpool_resource_group_name
  location            = each.value.mssql_elasticpool_location
  server_name         = each.value.mssql_elasticpool_server_name
  license_type        = each.value.mssql_elasticpool_license_type
  max_size_gb         = each.value.mssql_elasticpool_max_size_gb
  max_size_bytes      = each.value.mssql_elasticpool_max_size_bytes #One of either max_size_gb or max_size_bytes must be specified.
  zone_redundant      = each.value.mssql_elasticpool_zone_redundant

  sku {
    name     = each.value.mssql_elasticpool_sku.sku_name
    tier     = each.value.mssql_elasticpool_sku.sku_tier
    family   = each.value.mssql_elasticpool_sku.sku_family
    capacity = each.value.mssql_elasticpool_sku.sku_capacity
  }

  per_database_settings {
    min_capacity = each.value.mssql_elasticpool_per_database_settings.min_capacity
    max_capacity = each.value.mssql_elasticpool_per_database_settings.max_capacity
  }

  tags = merge(each.value.mssql_elasticpool_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}