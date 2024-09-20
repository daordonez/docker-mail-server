#This block fetch the given resources group to deploy the network in it.
data "azurerm_resource_group" "rg-main" {
  name = var.resource_group
}