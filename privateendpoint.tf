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

# Creating a private endpoint in CoreInfra for Key Vault communication with AKS Cluster
module "keyvault_private_endpoint_coreinfra" {
  source                          = "./modules/private_endpoint"
  name                            = "kv-coreinfra-private-endpoint"
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  resource_group_name             = module.resource_group_coreinfra.resource_group_name
  subnet_id                       = module.subnet_coreinfra-01.subnet_id
  private_service_connection_name = "KeyVault-CoreInfra-Conexn"
  private_connection_resource_id  = module.key_vault_coreinfra.key_vault_id
  subresource_names               = ["vault"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "KeyVault-PrivateEndpoint"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# # Creating a private endpoint in CoreInfra for StorageAccount communication
module "storageaccount_private_endpoint_coreinfra" {
  source                          = "./modules/private_endpoint"
  name                            = "sa-coreinfra-private-endpoint"
  location                        = "Australia SouthEast"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  resource_group_name             = module.resource_group_coreinfra.resource_group_name
  subnet_id                       = module.subnet_coreinfra-01.subnet_id
  private_service_connection_name = "StgAcc-CoreInfra-Conexn"
  private_connection_resource_id  = module.storage_account_coreinfra.storage_account_id
  subresource_names               = ["blob"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount-PrivateEndpoint"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# Creating a private endpoint in CoreInfra for Azure Monitor Workspace communication
module "azuremonitorworkspace_private_endpoint_coreinfra" {
  source                          = "./modules/private_endpoint"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  name                            = "azmonitorwkspc-coreinfra-private-endpoint"
  location                        = "Australia SouthEast"
  resource_group_name             = module.resource_group_coreinfra.resource_group_name
  subnet_id                       = module.subnet_coreinfra-01.subnet_id
  private_service_connection_name = "MonitorWorkspace-CoreInfra-Conexn"
  private_connection_resource_id  = module.azure_monitor_workspace.monitor_workspace_id
  subresource_names               = ["prometheusMetrics"]
  
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "AzureMonitorWorkspace-PrivateEndpoint"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# Creating a private endpoint in CoreInfra for Azure Monitor PrivateLink Scope communication
module "azuremonitorprivatelinkscope_private_endpoint_coreinfra" {
  source                          = "./modules/private_endpoint"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  name                            = "ampls-coreinfra-private-endpoint"
  location                        = "Australia SouthEast"
  resource_group_name             = module.resource_group_coreinfra.resource_group_name
  subnet_id                       = module.subnet_coreinfra-01.subnet_id
  private_service_connection_name = "AMPLS-CoreInfra-Conexn"
  private_connection_resource_id  = module.ampls.ampls_id
  subresource_names               = ["azuremonitor"]
  
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "AMPLS-PrivateEndpoint"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# Creating a private endpoint in CoreInfra for Azure Container Registry communication
module "azurecontainerregistry_private_endpoint_coreinfra" {
  source                          = "./modules/private_endpoint"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  name                            = "acr-coreinfra-private-endpoint"
  location                        = "Australia SouthEast"
  resource_group_name             = module.resource_group_coreinfra.resource_group_name
  subnet_id                       = module.subnet_coreinfra-01.subnet_id
  private_service_connection_name = "ACR-CoreInfra-Conexn"
  private_connection_resource_id  = module.azure_container_registry.acr_id
  subresource_names               = ["registry"]
  
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "ACR-PrivateEndpoint"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}