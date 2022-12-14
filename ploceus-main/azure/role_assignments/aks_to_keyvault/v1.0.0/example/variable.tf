#AKS CLUSTER VARIABLE
variable "aks_cluster_variables" {
  type = map(object({
    vnet_name                                = string
    resource_group_name                      = string
    subnet_name                              = string
    disk_encryption_set_name                 = string
    is_subnet_required                       = bool
    is_disk_encryption_set_required          = bool
    name                                     = string
    location                                 = string
    dns_prefix                               = string
    node_resource_group_name                 = string
    sku_tier                                 = string
    dns_prefix_private_cluster               = string
    private_cluster_enabled                  = bool
    private_dns_zone_id                      = string
    api_server_authorized_ip_ranges          = list(string)
    kubernetes_version                       = string
    automatic_channel_upgrade                = string
    default_node_pool_name                   = string
    default_node_pool_node_count             = number
    default_node_pool_vm_size                = string
    default_node_pool_type                   = string
    default_node_pool_availability_zones     = list(string)
    default_node_pool_enable_auto_scaling    = bool
    default_node_pool_max_count              = number
    default_node_pool_min_count              = number
    default_node_pool_enable_host_encryption = bool
    default_node_pool_enable_node_public_ip  = bool
    default_node_pool_max_pods               = number
    default_node_pool_node_labels            = map(string)
    default_node_pool_os_disk_size_gb        = number
    role_based_access_control_enabled        = bool
    aad_managed                              = bool
    aad_tenant_id                            = string
    aad_admin_group_object_ids               = list(string)
    aad_azure_rbac_enabled                   = bool
    aad_client_app_id                        = string
    aad_server_app_id                        = string
    aad_server_app_secret                    = string
    balance_similar_node_groups              = bool
    expander                                 = string
    max_graceful_termination_sec             = number
    max_node_provisioning_time               = string
    max_unready_nodes                        = number
    max_unready_percentage                   = number
    new_pod_scale_up_delay                   = string
    scale_down_delay_after_add               = string
    scale_down_delay_after_delete            = string
    scale_down_delay_after_failure           = string
    scan_interval                            = string
    scale_down_unneeded                      = string
    scale_down_unready                       = string
    scale_down_utilization_threshold         = number
    empty_bulk_delete_max                    = number
    skip_nodes_with_local_storage            = bool
    skip_nodes_with_system_pods              = bool
    network_plugin                           = string
    network_policy                           = string
    dns_service_ip                           = string
    docker_bridge_cidr                       = string
    outbound_type                            = string
    pod_cidr                                 = string
    service_cidr                             = string
    # load_balancer_sku                        = string
    # lb_outbound_ports_allocated              = string
    # lb_idle_timeout_in_minutes               = string
    # lb_managed_outbound_ip_count             = string
    # lb_outbound_ip_prefix_ids                = list(string)
    # lb_outbound_ip_address_ids               = list(string)
    identity_type                       = string
    azure_policy_enabled                = bool
    ingress_application_gateway_enabled = bool
    application_gateway_name            = string
    http_application_routing_enabled    = bool
    kube_dashboard_enabled              = bool
    oms_agent_enabled                   = bool
    log_analytics_workspace_name        = string
    user_identity_name                  = string
    aks_cluster_tags                    = map(string)
  }))
}

#KEY VAULT
variable "key_vault_variables" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    enabled_for_disk_encryption     = bool
    enabled_for_deployment          = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    soft_delete_retention_days      = string
    purge_protection_enabled        = bool
    sku_name                        = string
    key_permissions                 = list(string)
    secret_permissions              = list(string)
    storage_permissions             = list(string)
    key_vault_tags                  = map(string)
  }))
}

#AKS TO KEY VAULT ROLE ASSIGNMENT
variable "aks_keyvault_role_assignment_variables" {
  type = map(object({
    role_definition_name = string
    resource_group_name  = string
    key_vault_name       = string
  }))
}