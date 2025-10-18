resource "azurerm_linux_virtual_machine" "app_vm" {
  name                            = "multicloud-demo-app-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!" # ✅ Allow password login for demo
  disable_password_authentication = false           # ✅ Enables password access
  network_interface_ids           = [azurerm_network_interface.app_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = {
    Name = "multicloud-demo-app-vm"
  }
}
