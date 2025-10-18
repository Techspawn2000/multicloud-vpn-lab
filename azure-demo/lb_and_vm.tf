###################################
# Public IPs
###################################

# Public IP for Load Balancer
resource "azurerm_public_ip" "lb_ip" {
  name                = "multicloud-demo-lb-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ✅ Public IP for the Web VM
resource "azurerm_public_ip" "web_vm_ip" {
  name                = "multicloud-demo-web-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

###################################
# Network Interfaces
###################################

# ✅ NIC for Web VM
resource "azurerm_network_interface" "web_nic" {
  name                = "multicloud-demo-web-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "web-nic-config"
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_vm_ip.id
  }
}

# ✅ NIC for App VM
resource "azurerm_network_interface" "app_nic" {
  name                = "multicloud-demo-app-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "app-nic-config"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
  }
}

# ✅ NIC for DB VM
resource "azurerm_network_interface" "db_nic" {
  name                = "multicloud-demo-db-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "db-nic-config"
    subnet_id                     = azurerm_subnet.db.id
    private_ip_address_allocation = "Dynamic"
  }
}

###################################
# Load Balancer
###################################

resource "azurerm_lb" "web_lb" {
  name                = "multicloud-demo-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_ip.id
  }
}
