# Resource Group in the Master Subscription
module "resource_group_master" {
  source              = "./modules/resource_group"
  providers = {
    azurerm = azurerm.AKLAB-Master
  }
  resource_group_name = "rg-lab-master-ause-01"
  location            = "Australia SouthEast"
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "ResourceGroup"
      "Subscription" = "AKLAB-Master"
    }
  )
}

# Resource Group in the CoreInfra Subscription
module "resource_group_coreinfra" {
  source              = "./modules/resource_group"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  resource_group_name = "rg-lab-coreinfra-ause-01"
  location            = "Australia SouthEast"
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "ResourceGroup"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# Resource Group in the MicroServices Subscription
module "resource_group_microservicesinfra" {
  source              = "./modules/resource_group"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  resource_group_name = "rg-lab-microservicesinfra-ause-01"
  location            = "Australia SouthEast"
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "ResourceGroup"
      "Subscription" = "AKLAB-MicroServicesInfra"
    }
  )
}