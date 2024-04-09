#This module is used for linking storage accounts to receive Alerts only
module "log_analytics_linked_storage_account_custom" {
    source = "./modules/loganalytics_linkedstorageaccount"
    data_source_type = "CustomLogs"
    workspace_resource_id = module.monitor_log_analytics_workspace.workspace_id
    storage_account_ids = [module.storage_account_coreinfra.storage_account_id]
    resource_group_name = module.resource_group_coreinfra.resource_group_name
}