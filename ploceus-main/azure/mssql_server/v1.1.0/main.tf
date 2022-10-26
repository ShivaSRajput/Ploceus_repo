resource "azurerm_mssql_server" "server" {
  for_each = var.mssql_servers

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  version             = each.value.version

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator.login_email != null ? [1] : []
    content {
      login_username              = each.value.azuread_administrator.login_email
      object_id                   = each.value.azuread_administrator.object_id
      tenant_id                   = each.value.azuread_administrator.tenant_id
      azuread_authentication_only = each.value.azuread_administrator.azuread_authentication_only
    }
  }
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

  identity {
    type         = each.value.identity.type
    identity_ids = each.value.identity.type == "UserAssigned" ? distinct(compact(concat([each.value.primary_user_assigned_identity_id], each.value.identity.identity_ids))) : null
  }


  connection_policy                    = each.value.connection_policy
  minimum_tls_version                  = each.value.minimum_tls_version
  public_network_access_enabled        = each.value.public_network_access_enabled
  outbound_network_restriction_enabled = each.value.outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = each.value.identity.type == "UserAssigned" ? each.value.primary_user_assigned_identity_id : null

  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}


