
locals {
  ip_configuration = { for k, v in var.virtual_network_gateway_variables : k => v if lookup(v, "ip_configuration", "NULL") != "NULL" }
  default_local_network_gateways= {for k, v in var.virtual_network_gateway_variables : k => v if lookup(v, "default_local_network_gateway_name", "") != "" }
  ip_configurations = toset(flatten([
    for k, v in local.ip_configuration : [
      for val in v.ip_configuration : {
        resource_group_name    = v.resource_group_name
        public_ip_address_name = val.public_ip_address_name
        vnet_name              = val.vnet_name
      }
  ]]))
  public_ips = { for v in local.ip_configurations : v.public_ip_address_name => v }
  vnet_names = { for v in local.ip_configurations : v.vnet_name => v }

}

#Local Network Gateway
data "azurerm_local_network_gateway" "local_network_gateway" {
  for_each            = local.default_local_network_gateways
  name                = each.value.default_local_network_gateway_name
  resource_group_name = each.value.resource_group_name
}

#Public IP
data "azurerm_public_ip" "public_ip" {
  for_each            = local.public_ips
  name                = each.value.public_ip_address_name
  resource_group_name = each.value.resource_group_name
}

#Gateway Subnet details 
data "azurerm_subnet" "GatewaySubnet" {
  for_each             = local.vnet_names
  name                 = "GatewaySubnet"
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

#Virtual Network Gateway
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  for_each                         = var.virtual_network_gateway_variables
  name                             = each.value.name
  location                         = each.value.location
  resource_group_name              = each.value.resource_group_name
  type                             = each.value.type
  vpn_type                         = each.value.vpn_type
  default_local_network_gateway_id = each.value.default_local_network_gateway_name == "" ? null : data.azurerm_local_network_gateway.local_network_gateway[each.key].id
  edge_zone                        = each.value.edge_zone
  generation                       = each.value.generation
  private_ip_address_enabled       = each.value.private_ip_address_enabled
  active_active                    = each.value.active_active
  enable_bgp                       = each.value.enable_bgp
  sku                              = each.value.sku
  #An active-standby gateway requires exactly one ip_configuration block, 
  #an active-active gateway requires exactly two ip_configuration blocks 
  #an active-active zone redundant gateway with P2S configuration requires exactly three ip_configuration blocks 
  dynamic "ip_configuration" {
    for_each = toset(each.value.ip_configuration)
    content {
      name                          = ip_configuration.value.name
      public_ip_address_id          = data.azurerm_public_ip.public_ip[ip_configuration.value.public_ip_address_name].id #data block
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      subnet_id                     = data.azurerm_subnet.GatewaySubnet[ip_configuration.value.vnet_name].id
    }
  }
  dynamic "bgp_settings" {
    for_each = each.value.enable_bgp == true ? toset(each.value.bgp_settings) : toset([])
    content {
      asn         = bgp_settings.value.asn
      peer_weight = bgp_settings.value.peer_weight
      #peering_addresses = bgp_settings.value.peering_addresses
      #Only one peering_addresses block can be specified except when active_active of this Virtual Network Gateway is true
      dynamic "peering_addresses" {
        for_each = toset(bgp_settings.value.peering_addresses)
        content {
          ip_configuration_name = peering_addresses.value.ip_configuration_name
          apipa_addresses       = peering_addresses.value.apipa_addresses
        }
      }
    }
  }
  dynamic "vpn_client_configuration" {
    for_each = each.value.vpn_client_configuration_enabled == true ? toset(each.value.vpn_client_configuration) : toset([])
    content {
      address_space        = vpn_client_configuration.value.address_space
      vpn_auth_types       = vpn_client_configuration.value.vpn_auth_types
      vpn_client_protocols = vpn_client_configuration.value.vpn_client_protocols
      #If vpn_auth type has AAD
      aad_audience = vpn_client_configuration.value.aad_audience
      aad_issuer   = vpn_client_configuration.value.aad_issuer
      aad_tenant   = vpn_client_configuration.value.aad_tenant
      #If vpn_auth type has Radius
      radius_server_address = vpn_client_configuration.value.radius_server_address
      radius_server_secret  = vpn_client_configuration.value.radius_server_secret
      #If vpn_auth type has Certificate
      dynamic "root_certificate" {
        for_each = (vpn_client_configuration.value.root_certificate_enabled == true ? toset(vpn_client_configuration.value.root_certificate) : [])
        content {
          name             = vpn_client_configuration.value.root_certificate.name
          public_cert_data = vpn_client_configuration.value.root_certificate.public_cert_data
        }
      }
      dynamic "revoked_certificate" {
        for_each = vpn_client_configuration.value.root_revoked_certificate_enabled == true ? toset(vpn_client_configuration.value.root_revoked_certificate) : toset([])
        content {
          name             = root_revoked_certificate.value.name
          thumbprint = root_revoked_certificate.value.public_cert_data
        }
      }
    }
  }
  dynamic "custom_route" {
    for_each = (each.value.custom_route_enabled == true ? toset(each.value.custom_route) : [])
    content {
      address_prefixes = custom_route.value.address_prefixes
    }
  }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
