data "azurerm_lb" "load_balancer" {
  for_each            = var.lb_natpools
  name                = each.value.load_balancer_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_lb_nat_pool" "lb_nat_pool" {
  for_each                       = var.lb_natpools
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  loadbalancer_id                = data.azurerm_lb.load_balancer[each.key].id
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  protocol                       = each.value.protocol
  frontend_port_start            = each.value.frontend_port_start
  frontend_port_end              = each.value.frontend_port_end
  backend_port                   = each.value.backend_port
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  floating_ip_enabled            = each.value.floating_ip_enabled 
  tcp_reset_enabled              = each.value.tcp_reset_enabled
}
