#redis_cache
module "redis_cache" {
  source      = "../"
  redis_cache = var.redis_cache
  tags        = var.tags
}