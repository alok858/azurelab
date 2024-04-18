variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the public IP will be created."
  type        = string
}

variable "allocation_method" {
  description = "Defines whether the IP address is static or dynamic."
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the public IP. Accepted values are Basic and Standard."
  type        = string
  default     = "Standard"
}

variable "ip_version" {
  description = "Specifies the IP version to use, IPv4 or IPv6."
  type        = string
  default     = "IPv4"
}

