output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "dev_subnet_id" {
  value = azurerm_subnet.dev.id
}

output "qa_subnet_id" {
  value = azurerm_subnet.qa.id
}

output "prod_subnet_id" {
  value = azurerm_subnet.prod.id
}
