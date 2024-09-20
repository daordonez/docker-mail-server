output "vnet_id" {
  description = "Virtual network ID after creation"
  value = azurerm_virtual_network.vnet-main.id
}