#EXPRESS ROUTE CIRCUIT AUTHORIZATION VARIABLES
express_route_circuit_authorization_variables = {
  "er1" = {
    express_route_circuit_authorization_name                       = "ploceuserca000001"
    express_route_circuit_authorization_express_route_circuit_name = "ploceusexpressroutecircuit000001"
    express_route_circuit_authorization_resource_group_name        = "ploceusrg000001"
  }
}

express_route_circuit_variables = {
  "express_route_1" = {
    name                     = "ploceusexpressroutecircuit000001"
    location                 = "westus2"
    resource_group_name      = "ploceusrg000001"
    service_provider_name    = "BSNL"
    peering_location         = "Mumbai"
    bandwidth_in_mbps        = 1000
    allow_classic_operations = false
    express_route_port_id    = null
    bandwidth_in_gbps        = null
    express_route_circuit_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    sku = {
      sku_tier   = "Standard"
      sku_family = "MeteredData"
    }
  }

}

resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}