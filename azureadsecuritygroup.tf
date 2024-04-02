module "azure_security_group01" {
  source        = "./modules/azuread_security_group"
  display_name  = "aad-sg-readonly-lab-microservicesinfra-ause-01"
  description   = "ReadOnly Security Group for AKS"
}

module "azure_security_group02" {
  source        = "./modules/azuread_security_group"
  display_name  = "aad-sg-admin-lab-microservicesinfra-ause-01"
  description   = "Admin Security Group for AKS"
}
