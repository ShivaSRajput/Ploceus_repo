#Azure AD GROUP
azure_ad_group_variables = {
  "aad_group_1" = {
    description             = "AD Group fro AKS administration"
    display_name            = "ploceus_aks_admin_group"
    is_owner_required       = true
    is_member_required      = true
    owners                  = "username@neudesic.com"
    members                 = "usernames@neudesic.com"
    security_enabled        = true
    types                   = ["Unified"]
    prevent_duplicate_names = true
  }
}

