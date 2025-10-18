resource "azurerm_linux_virtual_machine" "db_vm" {
  name                            = "multicloud-demo-db-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_B1s"
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.db_nic.id]
  custom_data                     = filebase64("${path.module}/cloud-init/cloud-init-db.yaml")

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
    Name = "multicloud-demo-db-vm"
  }
}
