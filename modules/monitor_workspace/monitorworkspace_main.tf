
resource "azurerm_monitor_workspace" "coreinfra" {
  name                = var.monitorworkspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  public_network_access_enabled = var.public_network_access_enabled
}