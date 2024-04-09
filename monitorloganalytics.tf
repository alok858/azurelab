module "monitor_log_analytics_workspace" {
  source              = "./modules/monitor_log_analytics"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  workspace_name      = "workspace-lab-coreinfra-ause-01"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_coreinfra.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  internet_ingestion_enabled = "false"
  internet_query_enabled = "false"

  

  tags = merge(
    local.common_tags,
    {
      "ResourceType" = "LogAnalyticsWorkspace-CoreInfra"
      "Subscription" = "AKLAB-CoreInfra"
    }
  )
}