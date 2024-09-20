#Create network security group
resource "azurerm_network_security_group" "nsg-main" {
  name = var.nsg_name
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg-main.name
}

#Virtual network
resource "azurerm_virtual_network" "vnet-main" {
  name = var.vnet_name
  location = var.location
  resource_group_name = data.azurerm_resource_group.rg-main.name
  address_space = [ var.vnet_cidr ]

  subnet {
    name = "${var.subnet_prefix_name}-subnet-tf"
    address_prefixes = ["10.0.1.0/24"]
  }
}