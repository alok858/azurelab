# ./modules/vnet/vnet-outputs.tf

# Output the Virtual Network ID
output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

# Output the Virtual Network Name
output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}

# Output the Virtual Network Address Space
output "vnet_address_space" {
  description = "The address space of the virtual network."
  value       = azurerm_virtual_network.vnet.address_space
}

# How to use these outputs in another file:
# resource "azurerm_subnet" "example" {
#   name                 = "example-subnet"
#   resource_group_name  =  module.resource_group_master.resource_group_name, or, 
#                           module.resource_group_CoreInfra.resource_group_name, or, 
#                           module.resource_group_MicroServices.resource_group_name  
#   virtual_network_name = module.vnet_master.vnet_name, or, 
#                           module.vnet_CoreInfra.vnet_name, or,
#                           module.vnet_MicroServices.vnet_name
#   address_prefixes     = ["10.0.1.0/24"]
# }
