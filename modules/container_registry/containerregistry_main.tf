resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  admin_enabled            = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  data_endpoint_enabled    = var.data_endpoint_enabled

  network_rule_set {
    default_action = "Deny"
    ip_rule = [{
      action   = "Allow"
      ip_range = var.ip_rule["ip_range"]
    }]
  }

  tags = var.tags
}
