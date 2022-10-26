locals {
  virtual_hub_variables = { for k, v in var.vpn_gateway_connection_variables : k => v if lookup(v, "routing_required", false) == true }
}

data "azurerm_resource_group" "vpn_site_resource_group" {
  provider = azurerm.vpn_site_subscription
  for_each = var.vpn_gateway_connection_variables
  name     = each.value.vpn_site_resource_group_name

}

data "azurerm_vpn_gateway" "vpn_gateway" {
  provider            = azurerm.vpn_gateway_subscription
  for_each            = var.vpn_gateway_connection_variables
  name                = each.value.vpn_gateway_name
  resource_group_name = each.value.vpn_gateway_resource_group_name
}

data "azurerm_virtual_hub" "virtual_hub" {
  provider            = azurerm.vpn_gateway_subscription
  for_each            = local.virtual_hub_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.virtual_hub_resource_group_name
}

## Terraform module to create Azure VPN Gateway Connection
resource "azurerm_vpn_gateway_connection" "vpn_gateway_connection" {
  provider                  = azurerm.vpn_gateway_subscription
  for_each                  = var.vpn_gateway_connection_variables
  name                      = each.value.name
  vpn_gateway_id            = data.azurerm_vpn_gateway.vpn_gateway[each.key].id
  remote_vpn_site_id        = "${data.azurerm_resource_group.vpn_site_resource_group[each.key].id}/providers/Microsoft.Network/vpnSites/${each.value.remote_vpn_site}"
  internet_security_enabled = each.value.internet_security_enabled

  # Routing
  dynamic "routing" {
    for_each = each.value.routing_required != false ? [1] : []
    content {
      associated_route_table = each.value.associated_route_table != null ? "${data.azurerm_virtual_hub.virtual_hub[each.key].id}/hubRouteTables/${each.value.associated_route_table}" : "${data.azurerm_virtual_hub.virtual_hub[each.key].id}/hubRouteTables/defaultRouteTable"
      propagated_route_table {
        labels          = each.value.propagated_route_table_labels != null ? each.value.propagated_route_table_labels : ["default"]
        route_table_ids = each.value.propagated_route_table_route_table_name != null ? formatlist("${data.azurerm_virtual_hub.virtual_hub[each.value.virtual_hub_name].id}/hubRouteTables/", (each.value.propagated_route_table_route_table_name)) : ["${data.azurerm_virtual_hub.virtual_hub[each.value.virtual_hub_name].id}/hubRouteTables/defaultRouteTable"]
      }
    }
  }

  dynamic "traffic_selector_policy" {
    for_each = each.value.traffic_selector_policy_required != false ? [1] : []
    content {
      local_address_ranges  = each.value.traffic_selector_local_address_ranges
      remote_address_ranges = each.value.traffic_selector_remote_address_ranges
    }
  }

  # VPN Link
  dynamic "vpn_link" {
    for_each = each.value.vpn_links != null ? toset(each.value.vpn_links) : []
    content {
      name                 = vpn_link.value.name
      bandwidth_mbps       = vpn_link.value.bandwidth_mbps
      bgp_enabled          = vpn_link.value.bgp_enabled
      connection_mode      = vpn_link.value.connection_mode
      egress_nat_rule_ids  = vpn_link.value.egress_nat_rule_ids
      ingress_nat_rule_ids = vpn_link.value.ingress_nat_rule_ids
      dynamic "custom_bgp_address" {
        for_each = vpn_link.value.bgp_enabled == true ? toset(vpn_link.value.custom_bgp_address) : []
        content {
          ip_address          = custom_bgp_address.value.ip_address
          ip_configuration_id = custom_bgp_address.value.ip_configuration_id
        }
      }
      dynamic "ipsec_policy" {
        for_each = vpn_link.value.ipsec_policies != null ? toset(vpn_link.value.ipsec_policies) : []
        content {
          integrity_algorithm      = ipsec_policy.value.integrity_algorithm
          pfs_group                = ipsec_policy.value.pfs_group
          sa_data_size_kb          = ipsec_policy.value.sa_data_size_kb
          sa_lifetime_sec          = ipsec_policy.value.sa_lifetime_sec
          dh_group                 = ipsec_policy.value.dh_group
          encryption_algorithm     = ipsec_policy.value.encryption_algorithm
          ike_encryption_algorithm = ipsec_policy.value.ike_encryption_algorithm
          ike_integrity_algorithm  = ipsec_policy.value.ike_integrity_algorithm
        }
      }
      local_azure_ip_address_enabled        = vpn_link.value.local_azure_ip_address_enabled
      policy_based_traffic_selector_enabled = vpn_link.value.policy_based_traffic_selector_enabled
      protocol                              = vpn_link.value.protocol
      ratelimit_enabled                     = vpn_link.value.ratelimit_enabled
      route_weight                          = vpn_link.value.route_weight
      shared_key                            = vpn_link.value.shared_key
      vpn_site_link_id                      = "${data.azurerm_resource_group.vpn_site_resource_group[each.key].id}/providers/Microsoft.Network/vpnSites/${each.value.remote_vpn_site}/vpnSiteLinks/${vpn_link.value.vpn_site_link_name}"
    }
  }
}
