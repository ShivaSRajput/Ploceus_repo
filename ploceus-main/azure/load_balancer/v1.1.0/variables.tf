variable "load_balancers_variables" {
  type = map(object({
    load_balancer_name                = string
    load_balancer_resource_group_name = string
    load_balancer_location            = string
    load_balancer_edge_zone           = string
    load_balancer_frontend_ip_configuration = map(object({
      frontend_ip_configuration_name  = string
      frontend_ip_configuration_zones = list(string)
      frontend_ip_configuration_subnet = object({
        subnet_name                    = string
        subnet_virtual_network_name    = string
        virtual_network_resource_group = string
      })
      frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = object({
        gateway_load_balancer_name                = string
        gateway_load_balancer_resource_group_name = string
      })
      frontend_ip_configuration_private_ip_address            = string
      frontend_ip_configuration_private_ip_address_allocation = string
      frontend_ip_configuration_private_ip_address_version    = string
      frontend_ip_configuration_public_ip_address_id = object({
        public_ip_name                = string
        public_ip_resource_group_name = string
      })
      frontend_ip_configuration_public_ip_prefix_id = object({
        public_ip_prefix_name                = string
        public_ip_prefix_resource_group_name = string
      })
    }))
    load_balancer_sku      = string
    load_balancer_sku_tier = string
    load_balancer_tags     = map(string)
  }))
  default = {}
}