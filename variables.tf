variable "aklab_master_subscription_id" {
  description = "Azure subscription ID for the AKLAB-Master provider alias."
  type        = string
}

variable "aklab_coreinfra_subscription_id" {
  description = "Azure subscription ID for the AKLAB-CoreInfra provider alias."
  type        = string
}

variable "aklab_microservicesinfra_subscription_id" {
  description = "Azure subscription ID for the AKLAB-MicroServicesInfra provider alias."
  type        = string
}

variable "azuread_tenant_id" {
  description = "Azure AD tenant ID used by the AzureAD provider and Key Vault resources."
  type        = string
}

variable "ca_certificate_pfx_path" {
  description = "Local path to the CA certificate PFX file used for Key Vault certificate import."
  type        = string
  sensitive   = true
  default     = null
}

variable "ca_certificate_pfx_password" {
  description = "Password for the CA certificate PFX file."
  type        = string
  sensitive   = true
  default     = null
}

variable "acr_allowed_ip_rule" {
  description = "Optional public IP CIDR range allowed to reach the Azure Container Registry."
  type        = map(string)
  default     = {}
}

variable "key_vault_allowed_ip_rules" {
  description = "Optional public IP CIDR ranges allowed to reach Key Vault network ACLs."
  type        = list(string)
  default     = []
}

variable "storage_account_master_allowed_ip_addresses" {
  description = "Optional public IP CIDR ranges allowed to reach the master storage account."
  type        = list(string)
  default     = []
}

variable "storage_account_coreinfra_allowed_ip_addresses" {
  description = "Optional public IP CIDR ranges allowed to reach the CoreInfra storage account."
  type        = list(string)
  default     = []
}

variable "aks_authorized_ip_ranges" {
  description = "Optional public IP CIDR ranges allowed to reach the AKS API server."
  type        = list(string)
  default     = []
}

variable "vm_nsg_ssh_source_address_prefix" {
  description = "Optional SSH source CIDR for the example VM NSG rule."
  type        = string
  default     = null
}
