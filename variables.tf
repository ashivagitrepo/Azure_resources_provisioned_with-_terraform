variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-azure-devops-cicd"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-azure-devops-cicd"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "dev_subnet_name" {
  description = "DEV subnet name"
  type        = string
  default     = "subnet-dev"
}

variable "qa_subnet_name" {
  description = "QA subnet name"
  type        = string
  default     = "subnet-qa"
}

variable "prod_subnet_name" {
  description = "PROD subnet name"
  type        = string
  default     = "subnet-prod"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_D2nlds_v6"
}

variable "admin_username" {
  description = "Linux VM administrator username"
  type        = string
  default     = "azureuser"
}
