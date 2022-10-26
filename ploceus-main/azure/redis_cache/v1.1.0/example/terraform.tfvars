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
redis_cache_variables = {
  "rediscache1" = {
    redis_cache_name                          = "ploceusredis000001"
    redis_cache_resource_group_name           = "ploceusrg000001"
    redis_cache_location                      = "westus2"
    redis_cache_capacity                      = "1"        #Allowed values for Basic,Standard SKU are 0-6. And for premium SKU 1-4
    redis_cache_family                        = "C"        #Allowed values are C(Basic,Standard) and P(Premium)
    redis_cache_sku_name                      = "Basic"    #Allowed values for SKU are Basic, Standard, Premium
    redis_cache_public_network_access_enabled = true
    redis_cache_subnet = ({
      redis_cache_virtual_network_name        = "ploceusvnet000001"
      redis_cache_subnet_name                 =  null
      redis_cache_vnet_resource_group_name    = "ploceusrg000001"
    })
    redis_cache_minimum_tls_version           = "1.2"       #Default value is 1.0
    redis_cache_redis_version                 = 6           #Only the allowed values are 4 or 6.Input the major version
    redis_cache_private_static_ip_address     = null
    redis_cache_shard_count                   = null        #Only works with Premium SKU
    redis_cache_replicas_per_master           = null        #Only works with Premium SKU and cannot be used in cojunction to Shard count
    redis_cache_replicas_per_primary          = null        #Only works with Premium SKU
    redis_cache_zones                         = null        #Only works with Premium SKU
    redis_cache_enable_non_ssl_port           = false
    redis_cache_tenant_settings               = {}
    redis_cache_identity = {
      redis_cache_identity_type = "SystemAssigned, UserAssigned" # Other values could be "UserAssigned", "SystemAssigned, UserAssigned"
      redis_cache_user_assigned_identities = [{
        identity_name                = "PloceusUserAssignedIdentity1"
        identity_resource_group_name = "ploceusrg000001"
        },
        {
          identity_name                = "PloceusUserAssignedIdentity2"
          identity_resource_group_name = "ploceusrg000001"
        },
        {
          identity_name                = "PloceusUserAssignedIdentity3"
          identity_resource_group_name = "ploceusrg000001"
      }]
    }
    redis_cache_patch_schedule = [
      {
        day_of_week        = "monday"
        start_hour_utc     = "20"
        maintenance_window = "PT5H"
      }
    ]
    redis_cache_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    redis_cache_redis_configuration = [
      {
        aof_backup_enabled    = false   #NOTE: To be used with Premium SKU, When AOF backup is set to true provide values of  storage account connection strings
        aof_storage_connection_string_0 = ""
        aof_storage_connection_string_1 = ""
        enable_authentication = true
        maxmemory_reserved    = "125"
        maxmemory_delta       = "125"
        maxmemory_policy      = "allkeys-lru"
        maxfragmentationmemory_reserved = "2" # Provide the as 2 if SKU is Basic, Standard = 50, Premium = 200
        rdb_backup_enabled    = false # If the value is set to true, provide the values for rdb_storage_connection_string
        rdb_storage_connection_string = "" # Provide the value of storage account connection string
        rdb_backup_frequency  = "15" # Only works with Premium SKU, Possible values are 15, 30, 60, 360, 720 and 1440.
        rdb_backup_max_snapshot_count = "4" # Only works with Premium SKU
        notify_keyspace_events = null # Only works with Premium SKU.Possible value is "AKE"

      }
    ]

  }
}

#VNET 
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001"
    location                    = "westus2"
    resource_group_name         = "ploceusrg000001"
    address_space               = ["10.0.0.0/16"]
    dns_servers                 = []
    flow_timeout_in_minutes     = null #possible values are between 4 and 30 minutes.
    bgp_community               = null
    edge_zone                   = null
    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
#Subnets
subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }
}
