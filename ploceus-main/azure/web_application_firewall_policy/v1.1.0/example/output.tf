#WEB_APPLICATION_FIREWALL_POLICY
output "web_application_firewall_policy_id" {
  value       = module.web_application_firewall_policy.web_application_firewall_policy_id
  description = "Web application firewall policy id"
}