output "public_ip_id" {
  value       = azurerm_public_ip.public_ip.id
  description = "The resource ID of the public IP address."
}

output "public_ip_address" {
  value       = azurerm_public_ip.public_ip
  description = "The allocated public IP address."
}