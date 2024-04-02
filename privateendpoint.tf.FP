module "key_vault_private_endpoint" {
  source                          = "./modules/private_endpoint"
  name                            = "kv-private-endpoint"
  resource_group_name             = module.resource_group_master.resource_group_name
  location                        = "Australia SouthEast"
  subnet_id                       = module.subnet_master.subnet_id
  private_service_connection_name = "kvServiceConnection"
  private_connection_resource_id  = module.key_vault_master.key_vault_id //azurerm_key_vault.example.id
  subresource_names               = ["vault"]
  tags                            = {"Environment" = "Production"}
}

module "storage_account_private_endpoint" {
  source                          = "./modules/private_endpoint"
  name                            = "sa-private-endpoint"
  location                        = "Australia SouthEast"
  resource_group_name             = module.resource_group_master.resource_group_name
  subnet_id                       = module.subnet_master.subnet_id
  private_service_connection_name = "saServiceConnection"
  private_connection_resource_id  = module.storage_account_master.storage_account_id //azurerm_storage_account.example.id
  subresource_names               = ["blob"]
  tags                            = {"Environment" = "Production"}
}

