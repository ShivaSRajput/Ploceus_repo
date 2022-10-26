#Subnet -> Route Table Association Variables
variable "subnet_route_table_association_variables" {
  description = "Map of Subnet Route Table Association object"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    route_table_name     = string
  }))
}