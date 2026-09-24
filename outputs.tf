output "resource_group_name" {
  description = "Azure resource group name"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "Azure virtual network ID"
  value       = module.network.vnet_id
}

output "dev_subnet_id" {
  description = "DEV subnet ID"
  value       = module.network.dev_subnet_id
}

output "qa_subnet_id" {
  description = "QA subnet ID"
  value       = module.network.qa_subnet_id
}

output "prod_subnet_id" {
  description = "PROD subnet ID"
  value       = module.network.prod_subnet_id
}
output "dev_public_ip" {
  description = "DEV VM public IP"
  value       = module.dev_vm.public_ip_address
}

output "qa_public_ip" {
  description = "QA VM public IP"
  value       = module.qa_vm.public_ip_address
}

output "prod_public_ip" {
  description = "PROD VM public IP"
  value       = module.prod_vm.public_ip_address
}
