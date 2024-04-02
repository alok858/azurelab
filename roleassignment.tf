# Assigning a storage contributor role to managed identity called 'mi-lab-master-ause-01'
resource "azurerm_role_assignment" "storage_account_contributor" {
  scope                = module.storage_account_master.storage_account_id
  role_definition_name = "Storage Account Contributor"
  principal_id         = module.managed_identity_master.managed_identity_principal_id
}