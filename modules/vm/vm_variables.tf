variable "vm_name" {
  description = "Name of the VM."
  type        = string
}

variable "location" {
  description = "Azure region for the VM."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the VM."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM."
  type        = string
}

variable "vm_size" {
  description = "Size of the VM."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for the VM admin."
  type        = string
}

variable "network_interface_ids" {
  description = "Network Card IDs"
  type        = list(string)
}