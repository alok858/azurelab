# Main configuration file for Azure Monitor Private Link Scopes
resource "azurerm_monitor_private_link_scope" "coreinfra" {
  name                = var.ampls_name
  resource_group_name = var.resource_group_name
}
