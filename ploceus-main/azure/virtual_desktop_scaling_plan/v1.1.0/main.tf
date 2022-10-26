# azure virtual desktop workspace
data "azurerm_resources" "host_pool" {
  type                = "Microsoft.DesktopVirtualization/hostpools"
  for_each            = var.desktop_scaling_plan_variables
  name                = each.value.host_pool.host_pool_name
  resource_group_name = each.value.host_pool.host_pool_resource_group_name
}

resource "azurerm_virtual_desktop_scaling_plan" "desktop_scaling_plan" {
  for_each = var.desktop_scaling_plan_variables

  name                = each.value.scaling_plan_name
  location            = data.azurerm_resources.host_pool[each.key].resources[0].location
  resource_group_name = each.value.scaling_plan_resource_group_name
  friendly_name       = each.value.friendly_name
  description         = each.value.description
  time_zone           = each.value.time_zone

  schedule {
    name         = each.value.schedule.name
    days_of_week = each.value.schedule.days_of_week

    ramp_up_start_time                 = each.value.schedule.ramp_up.start_time
    ramp_up_load_balancing_algorithm   = each.value.schedule.ramp_up.load_balancing_algorithm
    ramp_up_minimum_hosts_percent      = each.value.schedule.ramp_up.minimum_hosts_percent
    ramp_up_capacity_threshold_percent = each.value.schedule.ramp_up.capacity_threshold_percent

    peak_start_time               = each.value.schedule.peak.start_time
    peak_load_balancing_algorithm = each.value.schedule.peak.load_balancing_algorithm

    ramp_down_start_time                 = each.value.schedule.ramp_down.start_time
    ramp_down_load_balancing_algorithm   = each.value.schedule.ramp_down.load_balancing_algorithm
    ramp_down_minimum_hosts_percent      = each.value.schedule.ramp_down.minimum_hosts_percent
    ramp_down_force_logoff_users         = each.value.schedule.ramp_down.force_logoff_users
    ramp_down_wait_time_minutes          = each.value.schedule.ramp_down.wait_time_minutes
    ramp_down_notification_message       = each.value.schedule.ramp_down.notification_message
    ramp_down_capacity_threshold_percent = each.value.schedule.ramp_down.capacity_threshold_percent
    ramp_down_stop_hosts_when            = each.value.schedule.ramp_down.stop_hosts_when

    off_peak_start_time               = each.value.schedule.off_peak.start_time
    off_peak_load_balancing_algorithm = each.value.schedule.off_peak.load_balancing_algorithm
  }
  host_pool {
    hostpool_id          = replace(data.azurerm_resources.host_pool[each.key].resources[0].id, "/hostpools", "/hostPools")
    scaling_plan_enabled = each.value.host_pool.scaling_plan_enabled
  }

  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}