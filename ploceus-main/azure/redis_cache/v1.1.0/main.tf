locals {
  identities_list = flatten([
    for k, v in var.redis_cache_variables : [
      for i, j in v.redis_cache_identity.redis_cache_user_assigned_identities : [
        merge(
          {
            main_key   = k,
            nested_key = i,
          },
          j
        )
      ]
  ]])
}

data "azurerm_user_assigned_identity" "user_assigned_ids" {
  for_each            = { for v in local.identities_list : "${v.main_key},${v.nested_key}" => v }
  name                = each.value.identity_name
  resource_group_name = each.value.identity_resource_group_name
}

data "azurerm_subnet" "subnet_id" {
  for_each             = {for k,v in var.redis_cache_variables: k=>v.redis_cache_subnet if v.redis_cache_subnet.redis_cache_subnet_name != null}
  name                 = each.value.redis_cache_subnet_name
  virtual_network_name = each.value.redis_cache_virtual_network_name
  resource_group_name  = each.value.redis_cache_vnet_resource_group_name
}

resource "azurerm_redis_cache" "redis_cache" {
  for_each                      = var.redis_cache_variables
  name                          = each.value.redis_cache_name
  resource_group_name           = each.value.redis_cache_resource_group_name
  location                      = each.value.redis_cache_location
  capacity                      = each.value.redis_cache_capacity
  family                        = each.value.redis_cache_family
  sku_name                      = each.value.redis_cache_sku_name
  enable_non_ssl_port           = each.value.redis_cache_enable_non_ssl_port
  minimum_tls_version           = each.value.redis_cache_minimum_tls_version
  shard_count                   = each.value.redis_cache_shard_count 
  replicas_per_master           = each.value.redis_cache_replicas_per_master 
  replicas_per_primary          = each.value.redis_cache_replicas_per_primary 
  zones                         = each.value.redis_cache_zones
  public_network_access_enabled = each.value.redis_cache_public_network_access_enabled
  redis_version                 = each.value.redis_cache_redis_version
  tenant_settings               = each.value.redis_cache_tenant_settings
  private_static_ip_address     = each.value.redis_cache_private_static_ip_address
  subnet_id                     = lookup(data.azurerm_subnet.subnet_id,each.key,null)==null?null:data.azurerm_subnet.subnet_id[each.key].id
  tags                          = merge(each.value.redis_cache_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
  dynamic "identity" {
    for_each = each.value.redis_cache_identity.redis_cache_identity_type != null ? [1] : []
    content {
      type = each.value.redis_cache_identity.redis_cache_identity_type
      identity_ids = [
        for k, v in each.value.redis_cache_identity.redis_cache_user_assigned_identities : data.azurerm_user_assigned_identity.user_assigned_ids["${each.key},${k}"].id
      ]
    }
  }

  dynamic "patch_schedule" {
    for_each = each.value.redis_cache_patch_schedule
    content {
      day_of_week        = patch_schedule.value.day_of_week
      start_hour_utc     = patch_schedule.value.start_hour_utc
      maintenance_window = patch_schedule.value.maintenance_window
    }
  }
  dynamic "redis_configuration" {
    for_each = coalesce(each.value.redis_cache_redis_configuration)
    content {
      aof_backup_enabled              = redis_configuration.value.aof_backup_enabled
      aof_storage_connection_string_0 = redis_configuration.value.aof_storage_connection_string_0
      aof_storage_connection_string_1 = redis_configuration.value.aof_storage_connection_string_1
      enable_authentication           = redis_configuration.value.enable_authentication
      maxmemory_reserved              = redis_configuration.value.maxmemory_reserved
      maxmemory_delta                 = redis_configuration.value.maxmemory_delta
      maxmemory_policy                = redis_configuration.value.maxmemory_policy
      maxfragmentationmemory_reserved = redis_configuration.value.maxfragmentationmemory_reserved
      rdb_backup_enabled              = redis_configuration.value.rdb_backup_enabled
      rdb_storage_connection_string   = redis_configuration.value.rdb_storage_connection_string
      rdb_backup_frequency            = redis_configuration.value.rdb_backup_frequency
      rdb_backup_max_snapshot_count   = redis_configuration.value.rdb_backup_max_snapshot_count
      notify_keyspace_events          = redis_configuration.value.notify_keyspace_events
    }
  }
}