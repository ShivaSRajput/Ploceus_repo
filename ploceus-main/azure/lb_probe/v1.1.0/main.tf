data "azurerm_lb" "load_balancer" {
  for_each            = var.load_balancer_probe_variables
  name                = each.value.load_balancer_name
  resource_group_name = each.value.load_balancer_resource_group_name
}

resource "azurerm_lb_probe" "load_balancer_probe" {
  for_each            = var.load_balancer_probe_variables
  name                = each.value.load_balancer_probe_name
  loadbalancer_id     = data.azurerm_lb.load_balancer[each.key].id
  port                = each.value.load_balancer_probe_port
  protocol            = each.value.load_balancer_probe_protocol
  request_path        = lookup(each.value, "load_balancer_probe_protocol", null) == "Tcp" ? null : lookup(each.value, "load_balancer_probe_request_path", null)
  interval_in_seconds = lookup(each.value, "load_balancer_probe_interval", null)
  number_of_probes    = lookup(each.value, "load_balancer_probe_unhealthy_threshold", null)
}
