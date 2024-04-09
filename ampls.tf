# Creating Azure Monitor Private Link Scope
module "ampls" {
  source              = "./modules/ampls"
  ampls_name          = "ampls-lab-coreinfra-ause-01"
  resource_group_name = module.resource_group_coreinfra.resource_group_name
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
}
