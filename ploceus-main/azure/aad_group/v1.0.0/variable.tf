#Azure AD GROUP VARIABLE
variable "azure_ad_group_variables" {
  type = map(object({
    description             = string
    display_name            = string
    is_owner_required       = bool
    is_member_required      = bool
    owners                  = string
    members                 = string #list(string)
    security_enabled        = bool
    types                   = list(string)
    prevent_duplicate_names = bool
  }))
}
