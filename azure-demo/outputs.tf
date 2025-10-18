output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "web_vm_public_ip" {
  value = azurerm_public_ip.web_vm_ip.ip_address
}

output "db_vm_private_ip" {
  value = azurerm_network_interface.db_nic.private_ip_address
}