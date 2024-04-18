module "azure_container_registry" {
  source                = "./modules/container_registry"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  acr_name              = "ACRlabCoreInfraAUSE01"
  resource_group_name   = module.resource_group_coreinfra.resource_group_name
  location              = "Australia SouthEast"
  sku                   = "Premium"
  admin_enabled         = true
  public_network_access_enabled = true
  data_endpoint_enabled = true
  ip_rule               = { ip_range = "202.56.61.2/32" }
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "Azure Container Registry"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}

