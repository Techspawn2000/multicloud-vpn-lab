# resource_group.tf
resource "azurerm_resource_group" "main" {
  name     = "multicloud-demo-rg"
  location = "East US"
}