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
    #    site_config_ip_restriction    = map(object())
    site_config_min_tls_version           = number
    site_config_use_32_bit_worker_process = bool
    function_app_tags                     = map(string)
  }))
}
