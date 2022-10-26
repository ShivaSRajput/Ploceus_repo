# Sentinel alert rule ms security incident OUTPUT
output "sentinel_alert_rule_ms_security_incident_ids" {
  description = "The ID of the Sentinel alert rule ms security incident"
  value       = module.sentinel_alert_rule_ms_security_incident.sentinel_alert_rule_ms_security_incident_ids
}
