locals {
  network_interface = format("net-%s-%s-%s-%03d", var.pod, var.project, var.environment, var.instance)
  ip_config         = format("ip-%s-%s-%s-%03d", var.pod, var.project, var.environment, var.instance)
  vm_name           = format("vm-%s-%s-%s-%s", var.pod, var.project, var.environment, var.instance)
}

data "azurerm_resource_group" "hub" {
  name = var.hub_resource_group
}

data "azurerm_resource_group" "vm_rg" {
  name = var.vm_resource_group
}

resource "azurerm_network_interface" "example" {
  name                = local.network_interface
  location            = data.azurerm_resource_group.vm_rg.location
  resource_group_name = data.azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = local.ip_config
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {

  name                  = local.vm_name
  location              = data.azurerm_resource_group.vm_rg.location
  resource_group_name   = data.azurerm_resource_group.vm_rg.name
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  size                  = var.sku_size
  network_interface_ids = [azurerm_network_interface.example.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}