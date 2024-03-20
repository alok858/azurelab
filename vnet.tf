# Creating Virtual Network in the Master Subscription
module "vnet_master" {
    source = "./modules/vnet"
    providers = {
      azurerm = azurerm.AKLAB-Master
    }
    vnet_name = "vnet-lab-master-ause-01"
    address_space = ["172.16.0.0/21"]
    location = "Australia SouthEast"
    resource_group_name = module.resource_group_master.resource_group_name
    tags = merge(
    local.common_tags,
    {
      "ResourceType" = "VirtualNetwork"
      "Subscription" = "AKLAB-Master"
    }
  )
}

# Creating Virtual Network in the CoreInfra Subscription
module "vnet_CoreInfra" {
    source = "./modules/vnet"
    providers = {
      azurerm = azurerm.AKLAB-CoreInfra
    }
    vnet_name = "vnet-lab-coreinfra-ause-01"
    address_space = ["172.17.0.0/21"]
    location = "Australia SouthEast"
    resource_group_name = module.resource_group_coreinfra.resource_group_name
    tags = merge(
    local.common_tags,
    {
      "ResourceType" = "VirtualNetwork"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

# Creating Virtual Network in the MicroServices Subscription
module "vnet_MicroServicesInfra" {
    source = "./modules/vnet"
    providers = {
      azurerm = azurerm.AKLAB-MicroServicesInfra
    }
    vnet_name = "vnet-lab-microservicesinfra-ause-01"
    address_space = ["172.18.0.0/21"]
    location = "Australia SouthEast"
    resource_group_name = module.resource_group_microservicesinfra.resource_group_name
    tags = merge(
    local.common_tags,
    {
      "ResourceType" = "VirtualNetwork"
      "Subscription" = "AKLAB-MicroServicesInfra"
    }
  )
}