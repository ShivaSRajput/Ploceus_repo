data "azurerm_lb" "this" {
  for_each            = var.load_balancer_backendpools
  name                = each.value.lb_name
  resource_group_name = each.value.lb_rgname
}

resource "azurerm_lb_backend_address_pool" "this" {
  for_each        = var.load_balancer_backendpools
  name            = each.value.name
  loadbalancer_id = data.azurerm_lb.this[each.key].id
  depends_on      = [data.azurerm_lb.this]
}
