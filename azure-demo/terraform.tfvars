project_name   = "multicloud-demo"
location       = "eastus"
vnet_cidr      = "10.10.0.0/16"
vm_size        = "Standard_B1s"
admin_username = "azureuser"
admin_password = "MySecurePassword123!"

subnet_cidrs = {
  web = "10.10.1.0/24"
  app = "10.10.2.0/24"
  db  = "10.10.3.0/24"
}