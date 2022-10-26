output "monitor_smart_detector_alert_rules_id" {
  value       = {for k,v in azurerm_monitor_smart_detector_alert_rule.monitor_smart_detector_alert_rules: k=>v.id}
  description = "monitor_smart_detector_alert_rule"
}
