#FIREWALL

locals {
  public_ips  = flatten([
    for ip_k, ip_v in var.firewall_variables :
    [
      for ip_config in coalesce(ip_v.additional_public_ips, []) :
      {
        ip_key                               = ip_k
        ip_configuration_name                = ip_config.ip_configuration_name
        public_ip_address_name               = ip_config.public_ip_address_name
        vnet_name                            = ip_config.vnet_name
        subnet_name                          = ip_config.subnet_name
        resource_group_name                  = ip_config.resource_group_name
      }
    ]
  ])
  
  is_management_ip_enabled = {
    for k, v in var.firewall_variables : 
    k => v if lookup(v, "management_ip_enabled", null) != false 
  } 

  is_virtual_hub_enabled = {
    for k, v in var.firewall_variables : 
    k => v if lookup(v, "virtual_hub_enabled", null) != false 
  } 
}

data "azurerm_public_ip" "firewall_public_ip" {
  for_each             = { for ip in local.public_ips : format("%s_%s", ip.ip_key, ip.ip_configuration_name) => ip }
  resource_group_name = each.value.resource_group_name
  name                = each.value.public_ip_address_name
}

data "azurerm_subnet" "subnet" {
  for_each             = { for ip in local.public_ips : format("%s_%s", ip.ip_key, ip.ip_configuration_name) => ip }
  virtual_network_name = each.value.vnet_name
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
}


resource "azurerm_firewall" "firewall" {
  for_each            = var.firewall_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku_name           = contains(["AZFW_VNet", "AZFW_Hub"], each.value.sku_name) ? each.value.sku_name : ""
  sku_tier           = contains(["Premium", "Standard"], each.value.sku_tier) ? each.value.sku_tier : ""
  zones              = try(each.value.zones, null) # list
  firewall_policy_id = each.value.policy_id
  dynamic "ip_configuration" {
    for_each = { for ip in local.public_ips : format("%s_%s", ip.ip_key, ip.ip_configuration_name) => ip if(ip.ip_key == each.key) }
    content {
      name                 = ip_configuration.value.ip_configuration_name
      public_ip_address_id = data.azurerm_public_ip.firewall_public_ip[format("%s_%s",ip_configuration.value.ip_key,ip_configuration.value.ip_configuration_name)].id
      subnet_id            = data.azurerm_subnet.subnet[format("%s_%s",ip_configuration.value.ip_key,ip_configuration.value.ip_configuration_name)].id
    }
  }
  dns_servers       = each.value.dns_servers
  private_ip_ranges = each.value.private_ip_ranges

  dynamic "management_ip_configuration" {
    for_each             = each.value.management_ip_enabled != false ? [local.is_management_ip_enabled[each.key]] : []
    content {
    name                 = management_ip_configuration.value.management_ip_configuration_name
    subnet_id            = management_ip_configuration.value.management_ip_configuration_subnet_id
    public_ip_address_id = management_ip_configuration.value.management_ip_configuration_public_ip_address_id
    }
  }
  threat_intel_mode = each.value.threat_intel_mode

  dynamic "virtual_hub" {
    for_each        = each.value.virtual_hub_enabled != false ? [local.is_virtual_hub_enabled[each.key]] : []
    content {
    virtual_hub_id  = virtual_hub.value.virtual_hub_id
    public_ip_count = virtual_hub.value.public_ip_count
    }
  }

  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
