#Management Group Variables
variable "management_group_variables" {
  type = map(object({
    name                         = string
    parent_management_group_name = string
    subscription_id              = list(string)
    level_number                 = number
  }))
}