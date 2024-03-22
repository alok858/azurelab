#Creating managedidentity for master subscription

module "managed_identity_master" {
  source    = "./modules/managedidentity"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  identity_name       = "mi-lab-master-ause-01"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_master.resource_group_name
  tags                = merge(
    local.common_tags,
    {
      "ResourceType" = "ManagedIdentity"
      "Subscription" = "AKLAB-Master"
    }
  )
}
