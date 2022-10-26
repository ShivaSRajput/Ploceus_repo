data "azurerm_lb" "load_balancer" {
  for_each            = var.loadbalancer_backend_address_pool_address
  name                = each.value.lb_rgname
  resource_group_name = each.value.lb_rgname
}

data "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  for_each        = var.loadbalancer_backend_address_pool_address
  name            = each.value.name
  loadbalancer_id = data.azurerm_lb.load_balancer[each.key].id
}
data "azurerm_virtual_network" "vnet" {
  for_each            = var.loadbalancer_backend_address_pool_address
  name                = each.value.name
  resource_group_name = each.value.vnet_rgname
}

resource "azurerm_lb_backend_address_pool_address" "address_pool_address" {
  for_each                = var.loadbalancer_backend_address_pool_address
  name                    = each.value.name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lb_backend_pool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.vnet[each.key].id
  ip_address              = each.value.ip_address
}
