module "public_ip" {
  source              = "./modules/public_ip"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  public_ip_name      = "my-public-ip"
  resource_group_name = module.resource_group_microservicesinfra.resource_group_name
  location            = "Australia SouthEast"  // Adjust the location as necessary
  allocation_method   = "Static"
  sku                 = "Standard"

}
