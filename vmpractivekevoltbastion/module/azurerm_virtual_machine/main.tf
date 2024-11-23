resource "azurerm_linux_virtual_machine" "azurerm_virtual_machine" {
  for_each            = var.VMS
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.userpassword[each.key].value

  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    data.azurerm_network_interface.data-inc[each.key].id
  ]

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }
  source_image_reference {
    publisher = each.value.source_publisher
    offer     = each.value.source_offer
    sku       = each.value.source_sku
    version   = each.value.source_version
  }
}

