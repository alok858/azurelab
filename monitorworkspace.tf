/* To enable and use Prometheus metrics, you will need to create separately Azure Monitor Workspace. 
    Also, as a prerequisite please register Microsoft.Monitor in the subscription. 
*/

# Azure CLI command to enable Microsoft.Monitor prior to running this terraform module is:
#           az account set --subscription "ID of the Azure Subscription hosting Azure Monitor Workspace"
#           az provider register --namespace 'Microsoft.Monitor'
#           az provider show --namespace 'Microsoft.Monitor' --query "registrationState"

module "azure_monitor_workspace" {
  source              = "./modules/monitor_workspace"
  providers = {
    azurerm = azurerm.AKLAB-CoreInfra
  }
  resource_group_name           = module.resource_group_coreinfra.resource_group_name
  location                      = "Australia SouthEast"
  monitorworkspace_name         = "monitorworkspace-lab-coreinfra-ause-01"
  //public_network_access_enabled = var.monitorworks
}