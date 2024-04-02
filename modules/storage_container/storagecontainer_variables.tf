variable "container_name" {
  description = "The name of the storage container."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "container_access_type" {
  description = "The access level configured for the container. Can be private, blob, or container."
  type        = string
  default     = "private"
}
