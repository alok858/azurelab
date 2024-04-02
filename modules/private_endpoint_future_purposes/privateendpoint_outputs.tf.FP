output "private_endpoint_id" {
  value       = azurerm_private_endpoint.this.id
  description = "The ID of the private endpoint."
}

output "private_endpoint_private_ip_address" {
  value = length(azurerm_private_endpoint.this.private_ip_addresses) > 0 ? azurerm_private_endpoint.this.private_ip_addresses[0] : ""
  description = "The private IP address of the private endpoint."
}

