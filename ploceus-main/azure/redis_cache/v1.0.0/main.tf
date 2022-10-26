resource "azurerm_resource_group" "resgroup" {
  name     = var.rg_name
  location = var.rg_location
}


resource "azurerm_redis_cache" "redis" {
  for_each                      = var.redis_cache
  name                          = lookup(each.value, "name")
  resource_group_name           = azurerm_resource_group.resgroup.name
  location                      = var.rg_location
  capacity                      = lookup(each.value, "capacity")
  family                        = lookup(each.value, "family")
  sku_name                      = lookup(each.value, "sku_name")
  enable_non_ssl_port           = lookup(each.value, "enable_non_ssl_port")
  minimum_tls_version           = lookup(each.value, "minimum_tls_version")
  shard_count                   = lookup(each.value, "sku_name") == "Premium" ? lookup(each.value, "shard_count") : null
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")
  private_static_ip_address     = lookup(each.value, "private_static_ip_address")
  subnet_id                     = lookup(each.value, "sku_name") == "Premium" ? lookup(each.value, "subnet_id") : null
  tags                          = var.tags

  dynamic "redis_configuration" {
    for_each = coalesce(each.value.redis_configuration)
    content {

      maxmemory_reserved = lookup(redis_configuration.value, "maxmemory_reserved")
      maxmemory_delta    = lookup(redis_configuration.value, "maxmemory_delta")
      maxmemory_policy   = lookup(redis_configuration.value, "maxmemory_policy")

    }
  }
}


resource "azurerm_management_lock" "rediscache-lock" {
  for_each   = var.redis_cache
  name       = "lock ${each.value.name}"
  scope      = azurerm_redis_cache.redis[each.key].id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's private"
}