variable "name" {
  description = "The name of the private endpoint."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the private endpoint is created."
  type        = string
}

variable "private_service_connection_name" {
  description = "The name of the private service connection."
  type        = string
}

variable "private_connection_resource_id" {
  description = "The resource ID of the Azure service for which the private endpoint is created."
  type        = string
}

variable "subresource_names" {
  description = "A list of subresource names which the private endpoint is able to connect to."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
