variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
}

variable "location" {
  description = "The location where the network security group will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the NSG is created."
  type        = string
}

variable "security_rules" {
  description = "List of security rules to be added to the NSG."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}
