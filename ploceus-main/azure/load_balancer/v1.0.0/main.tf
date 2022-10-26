locals {
  # It creates map of objects if public_ip_name is not null, from load_balancer variable
  public_ips = {
    for k, v in var.load_balancers :
    k => v if lookup(v, "public_ip_name", null) != null
  }
  # It creates frontend_ip_config list of objects, from load_balancers variable
  frontend_config = flatten([
    for lb_k, lb_v in var.load_balancers :
    [
      for fe_config in coalesce(lb_v.frontend_ip_config, []) :
      {
        lb_key                 = lb_k
        fe_name                = fe_config.name
        subnet_name            = fe_config.subnet_name
        vnet_name              = fe_config.vnet_name
        static_ip              = fe_config.static_ip
        availability_zone      = fe_config.availability_zone
        lb_resource_group_name = lb_v.lb_resource_group_name
      }
    ]
  ])
}

data "azurerm_resource_group" "this" {
  for_each = var.load_balancers
  name     = each.value.lb_resource_group_name
}

data "azurerm_public_ip" "pub_ip" {
  for_each            = local.public_ips
  name                = each.value.name
  resource_group_name = each.value.lb_resource_group_name
}

data "azurerm_subnet" "snet" {
  for_each             = { for fe in local.frontend_config : format("%s_%s", fe.lb_key, fe.fe_name) => fe }
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.lb_resource_group_name
}

resource "azurerm_lb" "this" {
  for_each            = var.load_balancers
  name                = each.value.name
  location            = data.azurerm_resource_group.this[each.key].location
  resource_group_name = each.value.lb_resource_group_name
  sku                 = each.value.sku
  dynamic "frontend_ip_configuration" {
    #Looping on frontend_config, for respective loadbalancer
    for_each = { for fe in local.frontend_config : format("%s_%s", fe.lb_key, fe.fe_name) => fe if(fe.lb_key == each.key) }
    content {
      name                          = frontend_ip_configuration.value.fe_name
      subnet_id                     = data.azurerm_subnet.snet[format("%s_%s", frontend_ip_configuration.value.lb_key, frontend_ip_configuration.value.fe_name)].id
      private_ip_address_allocation = frontend_ip_configuration.value.static_ip == null ? "dynamic" : "static"
      private_ip_address            = frontend_ip_configuration.value.static_ip
      public_ip_address_id          = each.value.public_ip_name == null ? null : data.azurerm_public_ip.pub_ip[each.key].id
      availability_zone             = frontend_ip_configuration.value.availability_zone == null ? "Zone-Redundant" : frontend_ip_configuration.value.availability_zone
    }
  }
  tags = each.value.lb_tags
}
