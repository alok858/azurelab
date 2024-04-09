variable "workspace_name" {
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

variable "sku" {
  description = "Specifies the SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values range between 30 and 730."
  type        = number
  default     = 30
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "internet_ingestion_enabled" {
  description = "Controls whether the workspace accepts data ingestion from public networks. Possible values are Enabled and Disabled."
  type        = string
  default     = "Disabled"
}

variable "internet_query_enabled" {
  description = "Controls whether the workspace accepts query requests from public networks. Possible values are Enabled and Disabled."
  type        = string
  default     = "Disabled"
}

variable "data_source_type" {
  description = "Defines logging type we want"
  type        = string
  default     = "CustomLogs"
}
