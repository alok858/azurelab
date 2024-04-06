module "monitor_log_analytics_workspace" {
  source              = "./modules/monitor_log_analytics"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  workspace_name      = "workspace-lab-coreinfra-ause-01"
  location            = "East US"
  resource_group_name = module.resource_group_coreinfra.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  
  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "VirtualNetwork"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}
