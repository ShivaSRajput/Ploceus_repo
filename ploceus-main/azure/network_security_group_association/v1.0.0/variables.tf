#Variables for NSG Association
variable "nsg_association_variable" {
  type = map(object({
    nic_association = list(object({
      nic_name            = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
    subnet_association = list(object({
      vnet_name           = string
      snet_name           = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
  }))
}