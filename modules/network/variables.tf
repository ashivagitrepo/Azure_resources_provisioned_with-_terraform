variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dev_subnet_name" {
  type = string
}

variable "qa_subnet_name" {
  type = string
}

variable "prod_subnet_name" {
  type = string
}
