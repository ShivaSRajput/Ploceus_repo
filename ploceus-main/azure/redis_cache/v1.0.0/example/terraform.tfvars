rg_name     = "testing-01"
rg_location = "westus2"
tags = {
  automated_by = "dipak"
}
redis_cache = {
  "rediscache11" = {
    name                          = "ploceusredis000001"
    capacity                      = "1"
    family                        = "C"
    sku_name                      = "Standard"
    public_network_access_enabled = true
    minimum_tls_version           = "1.2"
    private_static_ip_address     = null
    subnet_id                     = null
    shard_count                   = "2"
    enable_non_ssl_port           = false
    redis_configuration = [
      {
        maxmemory_reserved = "2"
        maxmemory_delta    = "2"
        maxmemory_policy   = "allkeys-lru"
      }
    ]

  }
}
