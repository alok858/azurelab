module "nic" {
  source              = "./modules/nic"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  nic_name            = "nic-aksgatewayvm-ause-01" //"${module.vm.vm_name}-nic"
  location            = "Australia SouthEast"
  resource_group_name = module.resource_group_microservicesinfra.resource_group_name
  subnet_id           = module.subnet_microservicesinfra-01.subnet_id
  public_ip_id        = module.public_ip.public_ip_id
  //vm_name             = module.vm.vm_name
  depends_on          = [module.public_ip]
}
