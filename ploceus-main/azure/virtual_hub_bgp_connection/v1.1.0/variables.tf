#Virtual Hub BGP Connection Variables
variable "virtual_hub_bgp_connection_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    virtual_hub_name    = string
    peer_asn            = number
    peer_ip             = string
  }))
}