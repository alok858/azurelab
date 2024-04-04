# AKS Cluster
terraform {
  required_version = ">= 0.13"
}

module "aks_cluster" {
  source = "./modules/aks"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra 
  }
  cluster_name        = "aks-cluster-lab-msi-au01"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_microservicesinfra.resource_group_name
  dns_prefix          = "myaksdns"
  vnet_subnet_id      = module.subnet_microservicesinfra-01.subnet_id # Ensure your subnet module outputs this
  service_cidr        = "10.0.0.0/23"
  
  //Before enabling VNET integration, please verify that the subscription where AKS is being deployed has this enabled. 
  //az feature show --namespace "Microsoft.ContainerService" --name "EnableAPIServerVnetIntegrationPreview"
  /*output:
  {
  "id": "/subscriptions/944b31f7-f993-4d82-a8c0-bdf906970613/providers/Microsoft.Features/providers/Microsoft.ContainerService/features/EnableAPIServerVnetIntegrationPreview",
  "name": "Microsoft.ContainerService/EnableAPIServerVnetIntegrationPreview",
  "properties": {
    "state": "Registered"
  },
  "type": "Microsoft.Features/providers/features"
  }
  */
  
  vnet_integration_enabled = true 
  api_server_subnet_id = module.subnet_microservicesinfra-03.subnet_id

  azure_active_directory_role_based_access_control ={
    managed = true
    admin_group_object_ids = [module.azure_security_group02.security_group_id]
  }

  user_assigned_identity_ids = [module.managed_identity_microservicesinfra.managed_identity_id]
  
  depends_on = [
    module.azure_security_group02,
    module.managed_identity_microservicesinfra
  ]
  
  tags                      = merge(
    local.common_tags,
    {
      "ResourceType" = "AKScluster"
      "Subscription" = "AKLAB-MicroservicesInfra"
    }
  )
}