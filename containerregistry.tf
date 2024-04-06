module "azure_container_registry" {
  source                = "./modules/container_registry"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  acr_name              = "ACRlabCoreInfraAUSE01" //5 to 50 alphanumeric only, must be unique
  resource_group_name   = module.resource_group_coreinfra.resource_group_name
  location              = "Australia SouthEast"
  sku                   = "Premium"
  admin_enabled         = true
  georeplication_locations = ["East US", "West Europe"]
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "Azure Container Registry"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )

  # depends_on = [
  #   module.resource_group_coreinfra,
  #   module.vnet_CoreInfra]
}
