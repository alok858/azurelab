variable "monitorworkspace_name" {
  description = "Specifies the name of the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Log Analytics workspace."
  type        = string
}

variable "public_network_access_enabled" {
  description = "To decide if public access should be allowed"
  type = string
  default = "false"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}