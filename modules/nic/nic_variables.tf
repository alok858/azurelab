variable "nic_name" {
  description = "Name of the network interface."
  type        = string
}

variable "location" {
  description = "Azure region where the network interface is created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the NIC will be located."
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP address associated with the NIC."
  type        = string
}

# variable "vm_name" {
#   description = "Name of the virtual machine associated with the NIC."
#   type        = string
# }
