
#############################################################################
# Provider Authentication
#############################################################################

variable "subscription_id" {
  description = "Azure subscription Id."
  default     = ""
}

variable "tenant_id" {
  description = "Azure tenant Id."
  default     = ""
}

variable "client_id" {
  description = "Azure service principal application Id"
  default     = ""
}

variable "client_secret" {
  description = "Azure service principal application Secret"
  default     = ""
}