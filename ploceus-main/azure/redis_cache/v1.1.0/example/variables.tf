variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "redis_cache_variables" {
  type = map(object({
    redis_cache_name                          = string
    redis_cache_resource_group_name           = string
    redis_cache_location                      = string
    redis_cache_capacity                      = string
    redis_cache_family                        = string
    redis_cache_sku_name                      = string
    redis_cache_public_network_access_enabled = bool # true means public access, false means private access for that we need private endpoint
    redis_cache_minimum_tls_version           = string
    redis_cache_private_static_ip_address     = string
    redis_cache_subnet = object({
      redis_cache_virtual_network_name        = string
      redis_cache_subnet_name                 = string
      redis_cache_vnet_resource_group_name    = string
    })
    redis_cache_shard_count                   = string
    redis_cache_replicas_per_master           = string
    redis_cache_replicas_per_primary          = string
    redis_cache_zones                         = list(string)
    redis_cache_enable_non_ssl_port           = bool
    redis_cache_redis_version                 = number
    redis_cache_tenant_settings               = map(string)
    redis_cache_identity = object({
      redis_cache_identity_type = string
      redis_cache_user_assigned_identities = list(object({
        identity_name                = string
        identity_resource_group_name = string
      }))
    })
    redis_cache_tags  = map(string)
    redis_cache_patch_schedule = list(object({
      day_of_week              = string
      start_hour_utc           = number
      maintenance_window       = string
    }))
    redis_cache_redis_configuration   = list(object({
      aof_backup_enabled              = bool
      aof_storage_connection_string_0 = string
      aof_storage_connection_string_1 = string
      enable_authentication           = bool
      maxmemory_reserved              = string
      maxmemory_delta                 = string
      maxmemory_policy                = string
      maxfragmentationmemory_reserved = string
      rdb_backup_enabled              = string
      rdb_storage_connection_string   = string
      rdb_backup_frequency            = string
      rdb_backup_max_snapshot_count   = string
      notify_keyspace_events          = string
    }))
  }))
  description = "Map containing redis_cache information"
  default = {

  }
}

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    flow_timeout_in_minutes     = number 
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    edge_zone                   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}