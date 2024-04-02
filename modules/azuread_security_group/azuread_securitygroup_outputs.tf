output "security_group_id" {
  value       = azuread_group.security_group.id
  description = "The object ID of the security group."
}

output "security_group_display_name" {
  value       = azuread_group.security_group.display_name
  description = "The display name of the security group."
}
