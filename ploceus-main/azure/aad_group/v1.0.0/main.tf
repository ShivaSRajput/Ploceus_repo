#AZURE AD GROUP

locals {
  is_owner_exists = { for k, v in var.azure_ad_group_variables : k => v if lookup(v, "is_owner_required", false) == true }
}

locals {
  is_member_exists = { for k, v in var.azure_ad_group_variables : k => v if lookup(v, "is_member_required", false) == true }
}

data "azuread_user" "ad_group_owner" {
  for_each            = local.is_owner_exists
  user_principal_name = each.value.owners
}

data "azuread_user" "ad_group_member" {
  for_each            = local.is_member_exists
  user_principal_name = each.value.members
}

resource "azuread_group" "azure_ad_group" {
  for_each                = var.azure_ad_group_variables
  description             = each.value.description
  display_name            = each.value.display_name
  owners                  = [each.value.is_owner_required == true ? data.azuread_user.ad_group_owner[each.key].id : null]
  members                 = [each.value.is_member_required == true ? data.azuread_user.ad_group_member[each.key].id : null]
  security_enabled        = each.value.security_enabled
  prevent_duplicate_names = each.value.prevent_duplicate_names
}






