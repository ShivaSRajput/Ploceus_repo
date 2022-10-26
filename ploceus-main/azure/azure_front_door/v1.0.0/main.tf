#AZURE FRONT DOOR  CLUSTER

locals {
  is_subnet_exists = { for k, v in var.aks_cluster_variables : k => v if lookup(v, "is_subnet_required", false) == true }
}

locals {
  is_user_identity_required = { for k, v in var.aks_cluster_variables : k => v if lookup(v, "identity_type", false) != "SystemAssigned" }
}

data "azurerm_virtual_network" "vnet_id" {
  for_each            = local.is_subnet_exists
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_frontdoor" "azure_front_door" {
  for_each            = var.azure_front_door_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  friendly_name       = each.value.friendly_name
  backend_pool {
    name = each.value.backend_pool_name
    backend {
      enabled     = each.value.backend_enabled
      address     = each.value.backend_address
      host_header = each.value.backend_host_header
      http_port   = each.value.backend_http_port
      https_port  = each.value.backend_https_port
      priority    = each.value.backend_priority
      weight      = each.value.backend_weight
    }
    load_balancing_name = each.value.backend_pool_load_balancing_name
    health_probe_name   = each.value.backend_pool_health_probe_name
  }
  backend_pool_health_probe {
    name                = each.value.backend_pool_health_probe_name
    enabled             = each.value.backend_pool_health_probe_enabled
    path                = each.value.backend_pool_health_probe_path
    protocol            = each.value.backend_pool_health_probe_protocol
    probe_method        = each.value.backend_pool_health_probe_probe_method
    interval_in_seconds = each.value.backend_pool_health_probe_probe_interval
  }
  backend_pool_load_balancing {
    name                            = each.value.backend_pool_load_balancing_name
    sample_size                     = each.value.backend_pool_load_balancing_sample_size
    successful_samples_required     = each.value.backend_pool_load_balancing_successful_samples
    additional_latency_milliseconds = each.value.backend_pool_load_balancing_additional_latency
  }
  frontend_endpoint {
    name                                    = each.value.frontend_endpoint_name
    host_name                               = each.value.frontend_endpoint_host_name
    session_affinity_enabled                = each.value.frontend_endpoint_session_affinity_enabled
    session_affinity_ttl_seconds            = each.value.frontend_endpoint_session_affinity_ttl_seconds
    web_application_firewall_policy_link_id = "data..............................................................."
  }
  routing_rule {
    name               = each.value.routing_rule_name
    frontend_endpoints = each.value.frontend_endpoint_name
    accepted_protocols = each.value.routing_rule_accepted_protocols
    patterns_to_match  = each.value.routing_rule_patterns_to_match
    enabled            = each.value.routing_rule_enabled
    # forwarding_configuration {
    #   "....................................................."
    # }
    # redirect_configuration {
    #   "....................................................."
    # }
  }
  backend_pools_send_receive_timeout_seconds   = each.value.backend_pools_send_receive_timeout_seconds
  enforce_backend_pools_certificate_name_check = each.value.enforce_backend_pools_certificate_name_check
  load_balancer_enabled                        = each.value.load_balancer_enabled


  tags = merge(each.value.azure_front_door_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}





