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

# Creating AKS CoreInfra Subnet for MicroServices Subscription VNET
module "subnet_coreinfra-01" {
  source = "./modules/subnet"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  resource_group_name   = module.resource_group_coreinfra.resource_group_name
  virtual_network_name  = module.vnet_CoreInfra.vnet_name
  subnet_name           = "aks-coreinfra-subnet-lab-ause-01"
  address_prefixes      = ["172.17.1.0/24"]
  service_endpoints     = ["Microsoft.KeyVault", "Microsoft.Storage", "Microsoft.ContainerRegistry"]
}

# Creating AKS Node Subnet for MicroServices Subscription VNET
module "subnet_microservicesinfra-01" {
  source = "./modules/subnet"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  resource_group_name   = module.resource_group_microservicesinfra.resource_group_name
  virtual_network_name  = module.vnet_MicroServicesInfra.vnet_name
  subnet_name           = "aks-nodesubnet-lab-microservices-ause-01"
  address_prefixes      = ["172.18.0.0/23"]
  service_endpoints     = ["Microsoft.AzureActiveDirectory", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry"]
}

# Creating API Server Subnet for MicroServices Subscription VNET
module "subnet_microservicesinfra-02" {
  source = "./modules/subnet"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  resource_group_name   = module.resource_group_microservicesinfra.resource_group_name
  virtual_network_name  = module.vnet_MicroServicesInfra.vnet_name
  subnet_name           = "aks-apisubnet-lab-microservices-ause-01"
  address_prefixes      = ["172.18.2.0/24"]
  //service_endpoints     = ["Microsoft.KeyVault", "Microsoft.Storage", "Microsoft.ContainerRegistry"]
  subnet_delegation    = [
    {
      name = "aksdelegation"
      service_delegation = [
        {
          name    = "Microsoft.ContainerService/managedClusters"
          actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      ]
    }
  ]
}