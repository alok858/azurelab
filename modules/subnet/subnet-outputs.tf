# modules/subnet/subnet-outputs.tf

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
}
