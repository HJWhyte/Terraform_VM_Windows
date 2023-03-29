
data "azurerm_subnet" "default" {
  name                 = "default"
  virtual_network_name = "vnet-ce05-00"
  resource_group_name  = "rg-kubce05-hub"
}

module "temple_windows_vm" {
  source             = "../../"
  hub_resource_group = var.hub_rg
  pod                = var.pod
  project            = var.project
  environment        = var.env
  instance           = var.inst
  vm_resource_group  = var.vm_rg
  subnet_id          = data.azurerm_subnet.default.id
  admin_username     = var.admin_user
  admin_password     = var.password
  sku_size           = var.sku_size

}