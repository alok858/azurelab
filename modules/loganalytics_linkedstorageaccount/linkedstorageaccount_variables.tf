variable "workspace_resource_id" {
  description = "log insights workspace id"
  type        = string
}

variable "storage_account_ids" {
  description = "storage account id in relation"
  type        = set(string)
}

 variable "data_source_type" {
   description = "log type declaration"
   type        = string
 }


variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}