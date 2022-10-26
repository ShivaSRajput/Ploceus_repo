#Postgresql Firewall Rule VARIABLES
variable "postgresql_firewall_rule_variables" {
  type = map(object({
    postgresql_firewall_rule_name                = string
    postgresql_firewall_rule_resource_group_name = string
    postgresql_firewall_rule_server_name         = string
    postgresql_firewall_rule_start_ip_address    = string
    postgresql_firewall_rule_end_ip_address      = string
  }))
}
