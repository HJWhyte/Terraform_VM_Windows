variable "hub_rg" {
  description = "Name of hub resource group"
  type        = string
}

variable "pod" {
  description = "Pod name"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Project environment"
  type        = string
}

variable "inst" {
  description = "Project instance"
  type        = string
}

variable "vm_rg" {
  description = "Name of VM resource group"
  type        = string
}

variable "admin_user" {
  description = "Admin User"
  type        = string
}

variable "password" {
  description = "secret password"
  type        = string
}

variable "sku_size" {
  type = string
}