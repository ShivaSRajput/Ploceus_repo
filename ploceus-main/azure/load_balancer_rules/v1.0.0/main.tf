data "azurerm_lb" "this" {
  for_each            = var.load_balancer_rules
  name                = each.value.lb_name
  resource_group_name = each.value.lb_rgname
}

data "azurerm_lb_backend_address_pool" "this" {
  for_each        = var.load_balancer_rules
  name            = each.value.backend_pool_name
  loadbalancer_id = data.azurerm_lb.this[each.key].id
  depends_on      = [data.azurerm_lb.this]
}

resource "azurerm_lb_probe" "this" {
  for_each            = var.load_balancer_rules
  name                = each.value.name
  resource_group_name = each.value.lb_rgname
  loadbalancer_id     = data.azurerm_lb.this[each.key].id
  port                = each.value.probe_port
  protocol            = each.value.probe_protocol
  request_path        = lookup(each.value, "probe_protocol", null) == "Tcp" ? null : lookup(each.value, "request_path", null)
  interval_in_seconds = lookup(each.value, "probe_interval", null)
  number_of_probes    = lookup(each.value, "probe_unhealthy_threshold", null)
}

resource "azurerm_lb_rule" "this" {
  for_each                       = var.load_balancer_rules
  name                           = each.value.name
  resource_group_name            = each.value.lb_rgname
  loadbalancer_id                = data.azurerm_lb.this[each.key].id
  protocol                       = each.value.lb_protocol == null ? "Tcp" : each.value.lb_protocol
  frontend_port                  = each.value.lb_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_name
  backend_address_pool_ids       = [data.azurerm_lb_backend_address_pool.this[each.key].id]
  probe_id                       = azurerm_lb_probe.this[each.key] == null ? null : azurerm_lb_probe.this[each.key].id
  load_distribution              = each.value.load_distribution
  idle_timeout_in_minutes        = each.value.idle_timeout_in_minutes
  enable_floating_ip             = each.value.enable_floating_ip == null ? false : each.value.enable_floating_ip
  disable_outbound_snat          = each.value.disable_outbound_snat == null ? false : each.value.disable_outbound_snat
  enable_tcp_reset               = each.value.enable_tcp_reset == null ? false : each.value.enable_tcp_reset
  depends_on                     = [azurerm_lb_probe.this]
}

