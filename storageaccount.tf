resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
}

module "storage_account_master" {
  source = "./modules/storage_account"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  storage_account_name      = "stgac${random_string.this.result}"
  resource_group_name       = module.resource_group_master.resource_group_name
  location                  = "Australia SouthEast"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  subnet_id                 = module.subnet_master.subnet_id
  allowed_ip_addresses      = ["14.137.17.39/24", "202.56.61.2"]
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "StorageAccount"
      "Subscription" = "AKLAB-Master"
    }
  )
}

