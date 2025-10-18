variable "project_name" {
  description = "Prefix for resource naming"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR for the VNet"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDRs for Web, App, DB subnets"
  type        = map(string)
}

variable "admin_username" {
  description = "VM admin username"
  type        = string
}

variable "admin_password" {
  description = "VM admin password"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "VM size for the demo"
  type        = string
}
