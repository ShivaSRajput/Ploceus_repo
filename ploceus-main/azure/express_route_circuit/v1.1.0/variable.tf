variable "express_route_circuit_variables" {
  description = "expressroute circuit variables"
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    service_provider_name      = string
    peering_location           = string
    bandwidth_in_mbps          = number
    allow_classic_operations   = bool
    express_route_port_id      = string
    bandwidth_in_gbps          = number
    express_route_circuit_tags = map(string)
    sku = object({
      sku_tier   = string #Required Values. Supports Basic, Local, Standard or Premium
      sku_family = string #Required Values. Supports MeteredData or UnlimitedData
    })
  }))
}
