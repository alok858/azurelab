#Creating a KeyVault
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
}
