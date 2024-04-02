module "storage_container_master" {
  source = "./modules/storage_container"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  storage_account_name      = "stgac${random_string.this.result}"
  container_name            = "container-lab-master-ause-01"
  container_access_type     = "private"
  
}