
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

variable "allowed_ip_rules" {
  description = "Public IP CIDR ranges allowed to reach the key vault network ACL."
  type        = list(string)
  default     = []
}

# variable "cert_file_path" {
#   description = "Path to the certificate file"
#   type        = string
# }
