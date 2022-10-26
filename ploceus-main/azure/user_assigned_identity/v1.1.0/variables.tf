#USER ASSIGNED IDENTITY VARIABLES
variable "user_assigned_identity_variables" {
  description = "Map of user assigned identity"
  type = map(object({
    user_assigned_identity_name                        = string
    user_assigned_identity_location                    = string
    user_assigned_identity_resource_group_name         = string
    user_assigned_identity_tags = map(string)
  }))
  default = {}
}
