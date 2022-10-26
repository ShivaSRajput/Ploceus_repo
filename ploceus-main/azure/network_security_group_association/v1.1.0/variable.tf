# Network security group association variable
variable "network_security_group_association" {
    type = map(object({
        nic_security_group_association = list(object({
            network_interface_name = string
            network_security_group_name = string # network_security_group_name to assiciate with network interface
            resource_group_name = string
        }))
        subnet_security_group_association = list(object({
            vnet_name = string
            subnet_name = string
            network_security_group_name = string # network_security_group_name to assiciate with subnet
            resource_group_name = string
        }))
    })) 
}
