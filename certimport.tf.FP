#Importing certificates
resource "azurerm_key_vault_certificate" "my_ca_cert_master" {
  provider = azurerm
  name         = "MAC-CAsignedCert-Alok"
  key_vault_id = module.key_vault_master.key_vault_id
  # location            = "Australia SouthEast"
  # resource_group_name = module.resource_group_master.resource_group_name
  certificate {
    contents = filepath("~/personalrepos/azurelab/letsencrypt/MyCA.pfx")
    password = "xxxx"
  }
  
}
