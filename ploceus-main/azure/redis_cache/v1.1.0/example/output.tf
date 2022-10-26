#Redis Cache
output "redis_cache_ids" {
  value       = module.redis_cache.redis_cache_ids
  description = "redis cache id's"
}