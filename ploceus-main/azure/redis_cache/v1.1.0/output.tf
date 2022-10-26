output "redis_cache_ids" {
  value       = { for k, v in azurerm_redis_cache.redis_cache : k => v.id }
  description = "redis cache id's"
}