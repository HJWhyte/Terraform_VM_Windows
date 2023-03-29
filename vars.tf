variable "hub_resource_group" {
  description = "Name of the hub resource group"
  type        = string
}

variable "pod" {
  description = "the best pod in ce05"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment type"
  type        = string
}

variable "instance" {
  description = "The instance number"
  type        = string
}

variable "vm_resource_group" {
  description = "Name of VM resource group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "admin_username" {
  description = "Admin Username"
  type        = string
}

variable "admin_password" {
  description = "Password"
  type        = string
}

variable "sku_size" {
  type = string
}