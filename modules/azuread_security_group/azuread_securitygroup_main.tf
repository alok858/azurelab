resource "azuread_group" "security_group" {
  display_name     = var.display_name
  mail_enabled     = false
  security_enabled = true
  description      = var.description
}
