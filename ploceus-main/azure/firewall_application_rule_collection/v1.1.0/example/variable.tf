#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#VNET VARIABLES
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    flow_timeout_in_minutes     = number
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
    edge_zone                   = string
  }))
  default = {}
}

#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}

#Variables for public IP
variable "public_ip_variables" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    zones                   = list(string)
    edge_zone               = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    reverse_fqdn            = string
    public_ip_prefix_id     = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
}

#FIREWALL VARIABLE
variable "firewall_variables" {
  type = map(object({
    name                                             = string
    resource_group_name                              = string
    location                                         = string
    vnet_name                                        = string
    subnet_name                                      = string
    sku_name                                         = string
    sku_tier                                         = string
    zones                                            = list(string)
    policy_id                                        = string
    dns_servers                                      = list(string)
    private_ip_ranges                                = list(string)
    management_ip_enabled                            = bool
    management_ip_configuration_name                 = string
    management_ip_configuration_subnet_id            = string
    management_ip_configuration_public_ip_address_id = string
    threat_intel_mode                                = string
    virtual_hub_enabled                              = bool
    virtual_hub_id                                   = string
    public_ip_count                                  = number
    tags                                             = map(string)
    additional_public_ips = list(object({
      ip_configuration_name  = string
      public_ip_address_name = string
      subnet_name            = string
      vnet_name              = string
      resource_group_name    = string
    }))
  }))
}

#FIREWALL APPLICATION RULE VARIABLES
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
      protocol = list(object(
        {
          protocol_type = string
          protocol_port = number
      }))
    }))
  }))
  default = {}
}

