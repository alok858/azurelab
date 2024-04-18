/*                This module creates Virtual Machine               */

/* Pre-Requisites: 

*/


module "vm" {
  source = "./modules/vm"
  providers = {
    azurerm = azurerm.AKLAB-MicroServicesInfra
  }
  vm_name = "AKS-Gateway-VM-01"
  location = "Australia SouthEast"
  resource_group_name = module.resource_group_microservicesinfra.resource_group_name
  subnet_id = module.subnet_microservicesinfra-01.subnet_id
  vm_size = "Standard_DS2_v2"
  admin_username = "break-glass-user"
  ssh_public_key = file("~/.ssh/id_rsa_azure.pub")
  network_interface_ids = [module.nic.network_interface_id]
  depends_on           = [module.nic, module.public_ip]
}

