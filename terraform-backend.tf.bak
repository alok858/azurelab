terraform {
  backend "azurerm" {
    resource_group_name   = "rg-lab-master-ause-01" //module.resource_group_master.resource_group_name
    storage_account_name  = "stgact1jrbq2t" //module.storage_account_master.storage_account_name
    container_name        = "container-lab-master-ause-01" //module.storage_container_master.storage_container_name
    key                   = "terraform.tfstate"
  }
}
