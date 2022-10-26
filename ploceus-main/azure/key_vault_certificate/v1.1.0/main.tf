data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.key_vault_certificate_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group_name
}
resource "azurerm_key_vault_certificate" "key_vault_certificate" {
  for_each     = var.key_vault_certificate_variables
  name         = each.value.certificate_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
  dynamic "certificate" {
    for_each = each.value.certificate != null ? toset(each.value.certificate) : []
    content {
      contents = certificate.value.contents
      password = certificate.value.password
    }
  }
  dynamic "certificate_policy" {
    for_each = each.value.certificate_policy != null ? toset(each.value.certificate_policy) : []
    content {
      dynamic "issuer_parameters" {
        for_each = certificate_policy.value.issuer_parameters != null ? toset(certificate_policy.value.issuer_parameters) : []
        content {
          name = issuer_parameters.value.issuer_name
        }
      }
      dynamic "key_properties" {
        for_each = certificate_policy.value.key_properties != null ? toset(certificate_policy.value.key_properties) : []
        content {
          curve      = key_properties.value.curve
          exportable = key_properties.value.exportable
          key_size   = key_properties.value.key_size
          key_type   = key_properties.value.key_type
          reuse_key  = key_properties.value.reuse_key
        }
      }
      dynamic "lifetime_action" {
        for_each = certificate_policy.value.lifetime_action != null ? toset(certificate_policy.value.lifetime_action) : []
        content {
          dynamic "action" {
            for_each = lifetime_action.value.action != null ? toset(lifetime_action.value.action) : []
            content {
              action_type = action.value.action_type
            }
          }
          dynamic "trigger" {
            for_each = lifetime_action.value.trigger != null ? toset(lifetime_action.value.trigger) : []
            content {
              days_before_expiry = trigger.value.days_before_expiry
            }
          }
        }
      }
      dynamic "secret_properties" {
        for_each = certificate_policy.value.secret_properties != null ? toset(certificate_policy.value.secret_properties) : []
        content {
          content_type = secret_properties.value.content_type
        }
      }
      dynamic "x509_certificate_properties" {
        for_each = certificate_policy.value.x509_certificate_properties != null ? toset(certificate_policy.value.x509_certificate_properties) : []
        content {
          extended_key_usage = x509_certificate_properties.value.extended_key_usage
          key_usage          = x509_certificate_properties.value.key_usage
          subject            = x509_certificate_properties.value.subject
          validity_in_months = x509_certificate_properties.value.validity_in_months
          dynamic "subject_alternative_names" {
            for_each = x509_certificate_properties.value.subject_alternative_names != null ? toset(x509_certificate_properties.value.subject_alternative_names) : []
            content {
              dns_names = subject_alternative_names.value.dns_names
              emails    = subject_alternative_names.value.emails
              upns      = subject_alternative_names.value.upns
            }
          }
        }
      }
    }
  }
  tags = merge(each.value.key_vault_certificate_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
