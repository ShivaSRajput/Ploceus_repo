#WEB_APPLICATION_FIREWALL_POLICY
output "web_application_firewall_policy_id" {
  value       = { for k, v in azurerm_web_application_firewall_policy.web_application_firewall_policy : k => v.id }
  description = "Web application firewall policy id"
}