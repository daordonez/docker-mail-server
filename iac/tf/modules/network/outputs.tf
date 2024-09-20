#VNET
output "vnet_info" {
  description = "Virtual network params after creation"
  value = {
    id = azurerm_virtual_network.vnet-main.id
    name = azurerm_virtual_network.vnet-main.name
  }
}

#SUBNET
output "subnet_info" {
  description = "Subnet params after creation"
  value = {
    id = azurerm_subnet.subnet-main.id
    name = azurerm_subnet.subnet-main.name
  }
}

#NSG
output "nsg_info" {
  description = "Network Seucrity Group ID after creation"
  value = {
    id = azurerm_network_security_group.nsg-main.id
    name = azurerm_network_security_group.nsg-main.name
  }
}