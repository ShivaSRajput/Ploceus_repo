
variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 32
}

variable "key_vault_secret_variables" {
     type = map(object({
   name = string
   value = string
   content_type = string
   not_before_date = string
   expiration_date = string
   resource_group_name = string
   key_vault_name      = string
   tags  = map(string)
   min_upper = number
   min_lower = number
   min_numeric = number
   min_special = number
   length = number
 }))
}
