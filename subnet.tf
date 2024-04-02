# Creating Subnets for Master Subscription VNET
module "subnet_master" {
  source = "./modules/subnet"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  resource_group_name  = module.resource_group_master.resource_group_name
  virtual_network_name = module.vnet_master.vnet_name
  subnet_name          = "subnet-lab-master-ause-01"
  address_prefixes     = ["172.16.1.0/24"]
  service_endpoints    = ["Microsoft.KeyVault", "Microsoft.Storage"]
}