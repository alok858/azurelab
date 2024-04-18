module "vm_nsg" {
  source = "./modules/nsg"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  nsg_name = "nsg-aks-msi-ause01-01"
  location = "Australia SouthEast"
  resource_group_name = module.resource_group_microservicesinfra.resource_group_name
  /*security_rules = [
    {
      name                       = "SSHAccess"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "202.56.61.2/32"
      destination_address_prefix = "*"
    },
    {
      name                       = "KubernetesAPI"
      priority                   = 110
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"//"Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"//"443"
      source_address_prefix      = "*"
      destination_address_prefix = "AzureKubernetesService"
    }
  ]*/
}

# Use a similar configuration for your AKS if needed
