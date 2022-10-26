#STORAGE CONTAINER VARIABLES
variable "storage_container_variables" {
  type = map(object({
  name                  = string
  storage_account_name  = string  
  container_access_type = string  
  metadata              = map(string)
  }))
}