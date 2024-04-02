output "storage_account_id" {
  value       = azurerm_storage_account.this.id
  description = "The ID of the storage account"
}

output "storage_account_name" {
  value = azurerm_storage_account.this.name
}
