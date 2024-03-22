
variable "key_vault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "object_id" {
  type = string
}

# variable "cert_file_path" {
#   description = "Path to the certificate file"
#   type        = string
# }
