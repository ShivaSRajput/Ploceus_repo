#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

route_table_variables = {
  "route-1" = {
    name                          = "ploceusrt00001"
    location                      = "westus2"
    resource_group_name           = "ploceusrg00002"
    disable_bgp_route_propagation = false
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    route = [{
      name                   = "ploceusroute001"
      address_prefix         = "10.3.0.0/16"
      next_hop_type          = "None"
      next_hop_in_ip_address = "10.2.0.0/24"
      },
      {
        name                   = "ploceusroute002"
        address_prefix         = "10.2.0.0/16"
        next_hop_type          = "None"
        next_hop_in_ip_address = "10.2.1.0/24"
    }]
  }
}

#Route Variables
route_variables = {
  "route-1" = {
    name                   = "ploceusroute003"
    route_table_name       = "ploceusrt00001"
    resource_group_name    = "ploceusrg00002"
    address_prefix         = "10.4.0.0/16"
    next_hop_type          = "VnetLocal"
    next_hop_in_ip_address = "10.2.0.0/24"
  }
}