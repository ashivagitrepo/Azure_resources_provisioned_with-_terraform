resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space

  dev_subnet_name  = var.dev_subnet_name
  qa_subnet_name   = var.qa_subnet_name
  prod_subnet_name = var.prod_subnet_name
}

module "dev_vm" {
  source = "./modules/vm"

  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  vm_name                   = "vm-dev"
  subnet_id                 = module.network.dev_subnet_id
  vm_size                   = var.vm_size
  admin_username            = var.admin_username
  ssh_public_key            = file("${path.root}/azure-devops-lab.pub")
  network_security_group_id = module.dev_nsg.nsg_id
}

module "qa_vm" {
  source = "./modules/vm"

  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  vm_name                   = "vm-qa"
  subnet_id                 = module.network.qa_subnet_id
  vm_size                   = var.vm_size
  admin_username            = var.admin_username
  ssh_public_key            = file("${path.root}/azure-devops-lab.pub")
  network_security_group_id = module.qa_nsg.nsg_id
}

module "prod_vm" {
  source = "./modules/vm"

  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  vm_name                   = "vm-prod"
  subnet_id                 = module.network.prod_subnet_id
  vm_size                   = var.vm_size
  admin_username            = var.admin_username
  ssh_public_key            = file("${path.root}/azure-devops-lab.pub")
  network_security_group_id = module.prod_nsg.nsg_id
}

module "dev_nsg" {
  source = "./modules/nsg"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  nsg_name            = "nsg-dev"
}

module "qa_nsg" {
  source = "./modules/nsg"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  nsg_name            = "nsg-qa"
}

module "prod_nsg" {
  source = "./modules/nsg"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  nsg_name            = "nsg-prod"
}
