#FIREWALL APPLICATION RULE COLLECTION VARIABLES
variable "firewall_application_rule_collection_variables" {
  type = map(object({
    firewall_application_rule_collection_name                = string
    firewall_application_rule_collection_location            = string
    firewall_application_rule_collection_resource_group_name = string
    firewall_application_rule_collection_azure_firewall_name = string
    firewall_application_rule_collection_priority            = string
    firewall_application_rule_collection_action              = string
    firewall_rule = list(object({
      rule_name             = string
      rule_description      = string
      rule_source_addresses = list(string)
      rule_source_ip_groups = list(string)
      rule_target_fqdns     = list(string)
      rule_fqdn_tags        = list(string)
      protocol              = list(object(
        {
          protocol_type = string
          protocol_port = number
        }
      ))
    }))
  }))
}