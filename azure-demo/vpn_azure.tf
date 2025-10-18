##################################################
# Azure VPN Infrastructure - vpn_azure.tf
# Author: Techspawn Global Solutions
##################################################

#-----------------------------------------------
# 4. Public IP for Azure VPN Gateway
#-----------------------------------------------
resource "azurerm_public_ip" "vpn_gw_ip" {
  name                = "azure-vpn-gw-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.255.0/27"]  # adjust to fit your VNet’s address space
}

#-----------------------------------------------
# 5. Azure VPN Gateway
#-----------------------------------------------
resource "azurerm_virtual_network_gateway" "vpn_gw" {
  name                = "azure-vpn-gw"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  active_active       = false
  enable_bgp          = false

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_gw_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

#-----------------------------------------------
# 6. Output Public IP (used by AWS)
#-----------------------------------------------
output "azure_vpn_gateway_public_ip" {
  value = azurerm_public_ip.vpn_gw_ip.ip_address
}
