resource "azurerm_log_analytics_linked_storage_account" "coreinfra-storageaccount" {
  data_source_type      = var.data_source_type
  workspace_resource_id = var.workspace_resource_id
  storage_account_ids   = var.storage_account_ids
  resource_group_name = var.resource_group_name
}