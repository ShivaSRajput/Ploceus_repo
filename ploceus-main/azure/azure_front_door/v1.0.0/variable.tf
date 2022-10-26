#AZURE FRONT DOOR VARIABLE
variable "azure_front_door_variables" {
  type = map(object({
    vnet_name             = string
    azure_front_door_tags = map(string)
  }))
}
