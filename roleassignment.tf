# Assigning a storage contributor role to managed identity called 'mi-lab-master-ause-01' in the MASTER
resource "azurerm_role_assignment" "storage_account_contributor_master" {
  scope                = module.storage_account_master.storage_account_id
  role_definition_name = "Storage Account Contributor"
  principal_id         = module.managed_identity_master.managed_identity_principal_id
  depends_on = [
    module.storage_account_master
   ]
}

# Assigning Network Contributor role to managed identity called "mi-lab-msi-ause-01" in the MicroServicesInfra
resource "azurerm_role_assignment" "network_contributor_msi" {
  scope                = module.subnet_microservicesinfra-02.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = module.managed_identity_microservicesinfra.managed_identity_principal_id
}

# Assigning Storage Contributor role to managed identity called "mi-lab-msi-ause-01" in the MicroServicesInfra. The storageaccount is hosted in CoreInfra Subscription
resource "azurerm_role_assignment" "storage_account_contributor_coreinfra" {
  scope                = module.storage_account_coreinfra.storage_account_id
  role_definition_name = "Storage Account Contributor"
  principal_id         = module.managed_identity_microservicesinfra.managed_identity_principal_id
  depends_on = [
    module.storage_account_coreinfra
   ]
}
