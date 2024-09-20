#Network deployment
module "network" {
  source         = "../modules/network"
  resource_group = var.resource_group
  location       = var.location
  vnet_name      = local.vnet_name
  subnet_name    = local.subnet_name
  nsg_name       = local.nsg_name
  tags           = local.tags
}

#VM deployment
module "vm-main" {
  source         = "../modules/vm"
  resource_group = var.resource_group
  location       = var.location
  name           = local.vm_name
  vnet_info      = module.network.vnet_info
  subnet_info    = module.network.subnet_info
  nsg_info       = module.network.nsg_info
}