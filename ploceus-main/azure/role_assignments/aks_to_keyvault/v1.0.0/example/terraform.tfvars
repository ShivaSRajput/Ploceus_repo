#AKS CLUSTER
aks_cluster_variables = {
  "aks_1" = {
    vnet_name                                = "ploceusvnet000003" #Optional parameter - Use only if specific subnet needs to be defined for Kubernetes cluster, if not keep it as null
    resource_group_name                      = "ploceus"
    subnet_name                              = "ploceussubnet000003" #Optional parameter - Use only if specific subnet needs to be defined for Kubernetes cluster, If not keep it as null
    disk_encryption_set_name                 = null
    is_subnet_required                       = false #Optional parameter - Keep it true only if specific subnet needs to be defined, If not keep it false  
    is_disk_encryption_set_required          = false
    name                                     = "ploceusaks000003"
    location                                 = "westus2"
    dns_prefix                               = "ploceusaks000003dns"
    node_resource_group_name                 = "ploceus_noderg000003"
    sku_tier                                 = "Free"
    dns_prefix_private_cluster               = null
    private_cluster_enabled                  = false
    private_dns_zone_id                      = null
    api_server_authorized_ip_ranges          = null
    kubernetes_version                       = "1.19.9"
    automatic_channel_upgrade                = null #"stable" This is in preview stage. Provide the value once this feature is in production
    default_node_pool_name                   = "senakspool03"
    default_node_pool_node_count             = 1
    default_node_pool_vm_size                = "Standard_D2_v3"
    default_node_pool_type                   = "VirtualMachineScaleSets"
    default_node_pool_availability_zones     = ["1", "2", "3"]
    default_node_pool_enable_auto_scaling    = true
    default_node_pool_max_count              = 3
    default_node_pool_min_count              = 2
    default_node_pool_enable_host_encryption = false
    default_node_pool_enable_node_public_ip  = false
    default_node_pool_max_pods               = 110
    default_node_pool_node_labels            = null
    default_node_pool_os_disk_size_gb        = 30
    role_based_access_control_enabled        = true
    aad_managed                              = true
    aad_tenant_id                            = null                                     #Optional parameter - Use this parameter if you want to use the specific Azure AD application tenant ID, if not keep it null and it will use tenant ID of the current Subscription 
    aad_admin_group_object_ids               = ["2d644380-095a-4e9c-9c92-a9286ad6ac0a"] #Optional parameter - Use this parameter only if aad_managed is true. Keep it as null if no Admin groups is used for Admin Role on the cluster. 
    aad_azure_rbac_enabled                   = false                                    #Optional parameter - Use this parameter only if aad_managed is true . Also Microsoft.ContainerService/EnableAzureRBACPreview feature flag should be enabled. Keep it as null if no azure_rabac is not required.
    aad_client_app_id                        = null                                     #Optional parameter - If aad_managed is false, this fields should be provided
    aad_server_app_id                        = null                                     #Optional parameter - If aad_managed is false, this fields should be provided
    aad_server_app_secret                    = null                                     #Optional parameter - If aad_managed is false, this fields should be provided
    balance_similar_node_groups              = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Possible values - true/false . Defaults to false. 
    expander                                 = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Possible values - least-waste/priority/most-pods/random . Defaults to random
    max_graceful_termination_sec             = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 600
    max_node_provisioning_time               = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 15m
    max_unready_nodes                        = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 3
    max_unready_percentage                   = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 45
    new_pod_scale_up_delay                   = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 10s
    scale_down_delay_after_add               = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to scan_interval
    scale_down_delay_after_delete            = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 3m
    scale_down_delay_after_failure           = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 10s
    scan_interval                            = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 10m
    scale_down_unneeded                      = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 10m
    scale_down_unready                       = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 20m
    scale_down_utilization_threshold         = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 0.5
    empty_bulk_delete_max                    = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Defaults to 10
    skip_nodes_with_local_storage            = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Possible values - true/false . Defaults to true
    skip_nodes_with_system_pods              = null                                     #Optional parameter - Use this parameter only if autoscaling is used, if not keep it as null. Possible values - true/false . Defaults to true
    network_plugin                           = "azure"
    network_policy                           = "azure"
    dns_service_ip                           = "12.0.2.10"
    docker_bridge_cidr                       = "172.17.0.1/16"
    outbound_type                            = null
    pod_cidr                                 = null
    service_cidr                             = "12.0.2.0/24"
    # load_balancer_sku                        = "Standard" #Defaults to "Standard", Provides LB profile if we are exclusively providing the load_balancer_sku. If not keep it to null
    # lb_outbound_ports_allocated              = null
    # lb_idle_timeout_in_minutes               = null
    # lb_managed_outbound_ip_count             = null
    # lb_outbound_ip_prefix_ids                = []
    # lb_outbound_ip_address_ids               = null
    identity_type                       = "SystemAssigned" #Best practise is to keep SystemAssigned since AKS creates a UserAssigned identity automatically to provide access to other resources & services. We need to provide access to that UserAssigned identity with necessary roles
    azure_policy_enabled                = false
    ingress_application_gateway_enabled = false
    application_gateway_name            = null
    http_application_routing_enabled    = true
    kube_dashboard_enabled              = false #Kubernetes Dashboard addon is deprecated for Kubernetes version >= 1.19.0. Keep it as true only if Kubernetes version is less than 1.19.0
    oms_agent_enabled                   = false
    log_analytics_workspace_name        = "ploceuslog000003" #Provide log analytics worksapce name if oms_agent_enabled is true. If not, keep it as null
    user_identity_name                  = null               #"ploceusaksuseridentity"
    aks_cluster_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    name                            = "ploceuskeyvault000003"
    location                        = "westus2"
    resource_group_name             = "ploceus"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = true
    soft_delete_retention_days      = "7"
    purge_protection_enabled        = false
    sku_name                        = "standard"
    key_permissions                 = []
    secret_permissions              = []
    storage_permissions             = []
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#AKS TO KEY VAULT ROLE ASSIGNMENT
aks_keyvault_role_assignment_variables = {
  "aks_keyvault_role_assignment_1" = {
    role_definition_name = "Key Vault Secrets User"
    resource_group_name  = "ploceus"
    key_vault_name       = "ploceuskeyvault000003"
  }
}
