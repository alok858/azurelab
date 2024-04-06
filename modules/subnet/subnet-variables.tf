# modules/subnet/subnet-variables.tf

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "List of service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "subnet_delegation" {
  description = "List of subnet delegations"
  type = list(object({
    name = string
    service_delegation = list(object({
      name    = string
      actions = list(string)
    }))
  }))
  default = []
}
