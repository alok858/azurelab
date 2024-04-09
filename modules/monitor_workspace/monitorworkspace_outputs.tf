output "name" {
  value = azurerm_monitor_workspace.coreinfra.name
}

output "monitor_workspace_id" {
  value       = azurerm_monitor_workspace.coreinfra.id
  description = "The Resource ID of the Azure Monitor Log Analytics Workspace."
}

output "workspace_location" {
  description = "The location of the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.coreinfra.location
}

output "workspace_public_network_access_enabled" {
  description = "Indicates whether public network access is enabled for the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.coreinfra.public_network_access_enabled
}

output "workspace_query_endpoint" {
  description = "The query endpoint for the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.coreinfra.query_endpoint
}

output "workspace_default_data_collection_endpoint_id" {
  description = "The default data collection endpoint ID for the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.coreinfra.default_data_collection_endpoint_id
}

output "workspace_default_data_collection_rule_id" {
  description = "The default data collection rule ID for the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.coreinfra.default_data_collection_rule_id
}
