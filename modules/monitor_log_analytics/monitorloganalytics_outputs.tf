output "workspace_id" {
  value       = azurerm_log_analytics_workspace.coreinfra.id
  description = "The ID of the Log Analytics Workspace."
}

output "primary_shared_key" {
  value       = azurerm_log_analytics_workspace.coreinfra.primary_shared_key
  description = "The Primary Shared Key for the Log Analytics Workspace."
}
