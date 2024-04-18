output "acr_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "The login server URL for the container registry."
}

output "acr_admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "The admin username for the container registry. Available when admin_enabled is true."
  sensitive   = true
}

output "acr_admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "The admin password for the container registry. Available when admin_enabled is true."
  sensitive   = true
}

output "acr_id" {
  value       = azurerm_container_registry.acr.id
  description = "The resource ID for the container registry."
}
