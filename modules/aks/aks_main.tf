resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id  # Ensure this variable is defined in your variables.tf
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    service_cidr = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  private_cluster_enabled = true
  api_server_access_profile {
    authorized_ip_ranges     = var.authorized_ip_ranges
    subnet_id                = var.api_server_subnet_id
    vnet_integration_enabled = var.vnet_integration_enabled
  }

  identity {
    type    = "UserAssigned"
    identity_ids = var.user_assigned_identity_ids
    //user_assigned_identity_ids = var.user_assigned_identity_id
  }

  tags = var.tags
}

