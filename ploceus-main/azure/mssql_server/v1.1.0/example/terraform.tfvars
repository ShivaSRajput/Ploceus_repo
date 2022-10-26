mssql_servers = {
  "server1" = {
    administrator_login                  = "saadmin"
    administrator_login_password         = "Password"
    connection_policy                    = "Default"
    location                             = "centralindia"
    minimum_tls_version                  = 1.2
    name                                 = "servvdi"
    outbound_network_restriction_enabled = false
    primary_user_assigned_identity_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ploceusrg000001/providers/Microsoft.ManagedIdentity/userAssignedIdentities/PloceusVDI"
    public_network_access_enabled        = true
    resource_group_name                  = "ploceusrg000001"
    tags = {
      "Created_By" = "Ploceus"
    }
    version = "12.0"
    azuread_administrator = {
      login_email                 = "XXXXXXXXXXX@neudesic.com"
      object_id                   = "00000000-0000-0000-0000-000000000000"
      tenant_id                   = "00000000-0000-0000-0000-000000000000"
      azuread_authentication_only = true
    }
    identity = {
      type = "UserAssigned"
      identity_ids = [
        "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ploceusrg000001/providers/Microsoft.ManagedIdentity/userAssignedIdentities/ploceusvdi",
        "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ploceusrg000001/providers/Microsoft.ManagedIdentity/userAssignedIdentities/ploceusdatabase"
      ]
    }
  }
}