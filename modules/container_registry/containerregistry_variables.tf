variable "acr_name" {
  description = "The name of the Azure Container Registry. Must be unique across Azure."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "The location/region where the Azure Container Registry is created."
  type        = string
}

variable "sku" {
  description = "The SKU name of the Azure Container Registry. Possible values include Basic, Standard, and Premium."
  type        = string
}

variable "admin_enabled" {
  description = "Indicates whether the admin user is enabled. Possible values are true or false."
  type        = bool
  default     = false
}

variable "georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "public_network_access_enabled" {
  description = "Indicates whether or not public network access is allowed for the container registry. Possible values are true or false."
  type        = bool
  default     = true
}

variable "ip_rule" {
  description = "Specifies an IP rule that allows access from a specific IP or range."
  type        = map(string)
  default     = {}
}

variable "data_endpoint_enabled" {
  description = "Indicates whether the dedicated data endpoint is enabled for the container registry."
  type        = bool
  default     = false
}
