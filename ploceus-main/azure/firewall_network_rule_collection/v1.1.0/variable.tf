#FIREWALL_NAT_RULE_COLLECTION
variable "firewall_network_rule_collection_variables" {
  type = map(object({
    name                  = string
    resource_group_name   = string
    azure_firewall_name   = string 
    priority              = string
    action                = string
  rule = list(object({
    name                  = string
    description           = string   
    source_ip_groups      = list(string)
    source_addresses      = list(string)
    destination_ports     = list(string)
    destination_addresses = list(string)
    destination_ip_groups = list(string)
    destination_fqdns     = list(string)
    protocols             = list(string)
    }))
  }))
}