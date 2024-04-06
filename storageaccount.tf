//User random string only if necessary
# resource "random_string" "this" {
#   length  = 8
#   special = false
#   upper   = false
# }

module "storage_account_master" {
  source = "./modules/storage_account"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  storage_account_name      = "stgaccmasteraus01" //3 to 24 lowercase alphanumeric only, must be unique.
  resource_group_name       = module.resource_group_master.resource_group_name
  location                  = "Australia SouthEast"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  subnet_id                 = module.subnet_master.subnet_id
  allowed_ip_addresses      = ["14.137.17.39/24", "202.56.61.2", "159.196.12.63"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount"
      "Subscription" = "AKLAB-Master"
    }
  )

  depends_on = [
    module.resource_group_master,
    module.vnet_master]
}

module "storage_account_coreinfra" {
  source = "./modules/storage_account"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  storage_account_name      = "stgacccoreinfraaus01"
  resource_group_name       = module.resource_group_coreinfra.resource_group_name
  location                  = "Australia SouthEast"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  subnet_id                 = module.subnet_microservicesinfra-01.subnet_id
  allowed_ip_addresses      = ["202.56.61.2", "159.196.12.63"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )

  # depends_on = [
  #   module.resource_group_microservicesinfra,
  #   module.vnet_MicroServicesInfra]
}