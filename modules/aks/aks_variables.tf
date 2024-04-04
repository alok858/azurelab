variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster."
  type        = string
}

variable "service_cidr" {
  description = "The network range used by Kubernetes service."
  type        = string
  default     = "10.0.0.0/23"
}

variable "dns_service_ip" {
  description = "An IP address within the service CIDR for the Kubernetes DNS service."
  type        = string
  default     = "10.0.0.10"  # Example default, ensure this is within your service_cidr range
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the AKS cluster's node pool should be deployed."
  type        = string
}

variable "authorized_ip_ranges" {
  description = "Set of authorized IP ranges to allow access to API server."
  type        = list(string)
  default     = []
}

variable "vnet_integration_enabled" {
  description = "Should API Server VNet Integration be enabled?"
  type        = bool
  default     = false
}

variable "api_server_subnet_id" {
  description = "The ID of the subnet where the AKS API server endpoint will be placed."
  type        = string
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "agentpool"
}

variable "azure_active_directory_role_based_access_control" {
  description = "Configuration block for Azure AD RBAC."
  type = object({
    managed                = bool
    admin_group_object_ids = list(string)
  })
}

variable "user_assigned_identity_ids" {
  description = "List of user-assigned managed identity IDs to be used by AKS."
  type        = list(string)
  default     = []
}

variable "node_count" {
  description = "The number of nodes for the cluster."
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "The size of the Virtual Machines to use for the nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
