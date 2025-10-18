variable "aws_region" {
  description = "AWS region for the demo"
  type        = string
}

variable "project_name" {
  description = "Name prefix for AWS resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "Map of subnet CIDRs"
  type        = map(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "azure_public_ip" {
  description = "Public IP address of the Azure VPN Gateway"
  type        = string
}
