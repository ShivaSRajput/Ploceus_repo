#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#APP SERVICE PLAN VARIABLE
variable "app_service_plan_variables" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    kind                             = string
    maximum_elastic_worker_count     = number
    reserved                         = bool
    app_service_environment_required = bool
    app_service_environment_name     = string
    sku_tier                         = string
    sku_size                         = string
    sku_capacity                     = number
    per_site_scaling                 = bool
    app_service_plan_tags            = map(string)
  }))
}

#STORAGE ACCOUNT VARIABLES
variable "storage_account_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = string
    access_tier                       = string
    enable_https_traffic_only         = bool
    min_tls_version                   = string
    allow_blob_public_access          = bool
    large_file_share_enabled          = bool
    blob_retention_policy             = number
    container_delete_retention_policy = number
    nfsv3_enabled                     = bool
    is_hns_enabled                    = bool
    storage_account_tags              = map(string)
  }))
}

#FUNCTION APP VARIABLE
variable "function_app_variables" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    client_affinity_enabled = bool
    client_cert_mode        = string
    enabled                 = bool
    enable_builtin_logging  = bool
    https_only              = bool
    os_type                 = string
    storage_account_name    = string
    version                 = string
    app_service_plan_name   = string
    identity_type           = string
    #    identity_identity_ids         = list(string)
    site_config_always_on         = bool
    site_config_ftps_state        = string
    site_config_health_check_path = string
    site_config_http2_enabled     = bool
    #    site_config_ip_restriction    = map(object)
    site_config_min_tls_version           = number
    site_config_use_32_bit_worker_process = bool
    function_app_tags                     = map(string)
  }))
}
