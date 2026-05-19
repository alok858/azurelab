#this script will link the AzureMonitor PrivateLinkScope with AzureMonitor LogAnalyticsWorkspace
resource "null_resource" "link_azmonitorprivatelinkscope_monitorloganalyticsworkspace" {
  provisioner "local-exec" {
    command = <<-EOT
      az account set --subscription "${var.aklab_coreinfra_subscription_id}" &&
      az monitor private-link-scope scoped-resource create --resource-group rg-lab-coreinfra-ause-01 --scope-name ampls-lab-coreinfra-ause-01 --name workspace-lab-coreinfra-ause-01 --linked-resource ${module.monitor_log_analytics_workspace.workspace_id}
      EOT
  }
  depends_on = [ 
    module.resource_group_coreinfra,
    module.azuremonitorworkspace_private_endpoint_coreinfra,
    module.azure_monitor_workspace,
    module.monitor_log_analytics_workspace
  ]
}

#pull docker image from vendor repository, in this case a sample image hosted on DockerHub
