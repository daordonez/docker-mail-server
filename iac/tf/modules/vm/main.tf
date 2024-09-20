#Public IP
resource "azurerm_public_ip" "pip" {
  name                = local.public_ip_name
  resource_group_name = data.azurerm_resource_group.rg-main.name
  location            = var.location
  allocation_method   = "Dynamic"
  sku = "Basic"
  
}

#Network interfaces
#Public NIC
resource "azurerm_network_interface" "nic-main-vm" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg-main.name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

#Internal NIC
resource "azurerm_network_interface" "nic-internal-vm" {
  name                = local.nic_internal_name
  resource_group_name = data.azurerm_resource_group.rg-main.name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

#Create a NSG rules
#Allow HTTP 443
resource "azurerm_network_security_rule" "Allow-443-nsgrule" {
  name                        = local.nsgrule_https_name
  resource_group_name         = data.azurerm_resource_group.rg-main.name
  network_security_group_name = var.nsg_info.name

  #Rule description
  access                     = "Allow"
  direction                  = "Inbound"
  priority                   = 100
  protocol                   = "Tcp"
  source_port_range          = "*"
  source_address_prefix      = "*"
  destination_port_range     = "443"
  destination_address_prefix = azurerm_network_interface.nic-main-vm.private_ip_address
}

#Allow HTTP 80
resource "azurerm_network_security_rule" "Allow-80-nsgrule" {
  name                        = local.nsgrule_http_name
  resource_group_name         = data.azurerm_resource_group.rg-main.name
  network_security_group_name = var.nsg_info.name

  #Rule description
  access                     = "Allow"
  direction                  = "Inbound"
  priority                   = 110
  protocol                   = "Tcp"
  source_port_range          = "*"
  source_address_prefix    = "*"
  destination_port_range     = "80"
  destination_address_prefix = azurerm_network_interface.nic-main-vm.private_ip_address
}

#Allow SSH 22
resource "azurerm_network_security_rule" "Allow-22-nsgrule" {
  name                        = local.nsgrule_ssh_name
  resource_group_name         = data.azurerm_resource_group.rg-main.name
  network_security_group_name = var.nsg_info.name

  #Rule description
  access                     = "Allow"
  direction                  = "Inbound"
  priority                   = 120
  protocol                   = "Tcp"
  source_port_range          = "*"
  source_address_prefix    = "${data.external.myipaddr.result.ip}"
  destination_port_range     = "22"
  destination_address_prefix = azurerm_network_interface.nic-main-vm.private_ip_address
}

#Associate NIC to main NSG
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id = azurerm_network_interface.nic-main-vm.id
  #it comes from network module deployment
  network_security_group_id = var.nsg_info.id
}

#Virtual Machine
resource "azurerm_linux_virtual_machine" "vm-main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg-main.name
  location            = var.location
  size                = local.selected_vm_size
  admin_username      = var.adminuser
  network_interface_ids = [
    azurerm_network_interface.nic-main-vm.id,
    azurerm_network_interface.nic-internal-vm.id,
  ]

    admin_ssh_key {
      username = var.adminuser
      public_key = file("~/.ssh/id_rsa.pub")
    }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
