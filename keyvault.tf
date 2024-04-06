#Creating a KeyVault in MASTER
provider "azurerm" {
    features {}
}

module "key_vault_master" {
  source    = "./modules/keyvault"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  key_vault_name      = "kv-lab-master-ause-01"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_master.resource_group_name
  tenant_id           = "f6841f89-d471-4dfc-9f2a-b35015a4a302"
  subnet_id           = module.subnet_master.subnet_id
  object_id           = module.managed_identity_master.managed_identity_principal_id
  
  tags                = merge(
    local.common_tags,
    {
      "ResourceType" = "KeyVault"
      "Subscription" = "AKLAB-Master"
    }
  )

  depends_on = [
    module.resource_group_master,
    module.vnet_master]
}

#Creating a KeyVault in CoreInfra. This will be used by AKS hosted in MicroServicesInfra

module "key_vault_coreinfra" {
  source    = "./modules/keyvault"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  key_vault_name      = "kv-lab-coreinfra-ause-01"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_coreinfra.resource_group_name
  tenant_id           = "f6841f89-d471-4dfc-9f2a-b35015a4a302"
  subnet_id           = module.subnet_coreinfra-01.subnet_id
  object_id           = module.managed_identity_microservicesinfra.managed_identity_principal_id
  
  tags                = merge(
    local.common_tags,
    {
      "ResourceType" = "KeyVault"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )

  # depends_on = [
  #   module.resource_group_microservicesinfra,
  #   module.vnet_MicroServicesInfra]
}