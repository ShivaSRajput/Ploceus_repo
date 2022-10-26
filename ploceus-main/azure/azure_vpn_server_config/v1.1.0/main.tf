resource "azurerm_vpn_server_configuration" "vpn_server_configuration" {
    for_each = var.vpn_server_config
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    vpn_protocols = each.value.vpn_protocols
    dynamic "ipsec_policy" {
        for_each = lookup(each.value, "is_auth_type_AAD", true) ? [] : each.value.ipsec_policy
        content {
            dh_group = ipsec_policy.value.dh_group
            ike_encryption = ipsec_policy.value.ike_encryption
            ike_integrity = ipsec_policy.value.ike_integrity
            ipsec_encryption = ipsec_policy.value.ipsec_encryption
            ipsec_integrity = ipsec_policy.value.ipsec_integrity
            pfs_group = ipsec_policy.value.pfs_group
            sa_lifetime_seconds = ipsec_policy.value.sa_lifetime_seconds
            sa_data_size_kilobytes = ipsec_policy.value.sa_data_size_kilobytes
        }
    }
    vpn_authentication_types = each.value.vpn_authentication_types
    dynamic "client_root_certificate" {
        for_each = lookup(each.value, "is_auth_type_certificate", true) ? each.value.client_root_certificate : []
        content {
            name = client_root_certificate.value.name
            public_cert_data = client_root_certificate.value.public_cert_data
        }
    }
    dynamic "client_revoked_certificate" {
        for_each = lookup(each.value, "is_auth_type_certificate", true) ? each.value.client_revoked_certificate : []
        content {
            name = client_revoked_certificate.value.name
            thumbprint = client_revoked_certificate.value.thumbprint
        }
    }
    dynamic "radius" {
        for_each = lookup(each.value, "is_auth_type_radius", true) ? each.value.radius : []
        content {
            dynamic "server" {
                for_each = radius.value.server
                content {
                    address = server.value.address
                    secret = server.value.secret
                    score = server.value.score
                }
            }
            dynamic "server_root_certificate" {
                for_each = radius.value.server_root_certificate
                content {
                    name = server_root_certificate.value.name
                    public_cert_data = server_root_certificate.value.public_cert_data
                }
            }
        }
    }
    dynamic "azure_active_directory_authentication" {
        for_each = lookup(each.value, "is_auth_type_AAD", true) ? each.value.azure_active_directory_authentication : []
        content {
            audience = azure_active_directory_authentication.value.audience
            issuer = azure_active_directory_authentication.value.issuer
            tenant = azure_active_directory_authentication.value.tenant
        }
    }

    tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
  
}