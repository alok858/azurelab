# Creating a private endpoint in Master for Key Vault communication
module "keyvault_private_endpoint_master" {
  source                          = "./modules/private_endpoint"
  name                            = "kv-master-private-endpoint"
  resource_group_name             = module.resource_group_master.resource_group_name
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  subnet_id                       = module.subnet_master.subnet_id
  private_service_connection_name = "KeyVaultMasterConn"
  private_connection_resource_id  = module.key_vault_master.key_vault_id
  subresource_names               = ["vault"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "KeyVault-PrivateEndpoint"
      "Subscription" = "AKLAB-Master"
    }
  )
}

# Creating a private endpoint in Master for Storage Account communication
module "storageaccount_private_endpoint_master" {
  source                          = "./modules/private_endpoint"
  name                            = "sa-master-private-endpoint"
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  resource_group_name             = module.resource_group_master.resource_group_name
  subnet_id                       = module.subnet_master.subnet_id
  private_service_connection_name = "StgAccMasterConn"
  private_connection_resource_id  = module.storage_account_master.storage_account_id
  subresource_names               = ["blob"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount-PrivateEndpoint"
      "Subscription" = "AKLAB-Master"
    }
  )
}

# Creating a private endpoint in MicroServicesInfra for Key Vault communication
module "keyvault_private_endpoint_msi" {
  source                          = "./modules/private_endpoint"
  name                            = "kv-msi-private-endpoint"
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  resource_group_name             = module.resource_group_microservicesinfra.resource_group_name
  subnet_id                       = module.subnet_microservicesinfra-02.subnet_id
  private_service_connection_name = "KeyVaultMSIConn"
  private_connection_resource_id  = module.key_vault_msi.key_vault_id
  subresource_names               = ["vault"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "KeyVault-PrivateEndpoint"
      "Subscription" = "AKLAB-MicroServicesInfra"
    }
  )
}

# # Creating a private endpoint in MicroServicesInfra for StorageAccount communication
module "storageaccount_private_endpoint_msi" {
  source                          = "./modules/private_endpoint"
  name                            = "sa-msi-private-endpoint"
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  resource_group_name             = module.resource_group_microservicesinfra.resource_group_name
  subnet_id                       = module.subnet_microservicesinfra-02.subnet_id
  private_service_connection_name = "StgAccMSIConn"
  private_connection_resource_id  = module.storage_account_msi.storage_account_id
  subresource_names               = ["blob"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount-PrivateEndpoint"
      "Subscription" = "AKLAB-MicroServicesInfra"
    }
  )
}