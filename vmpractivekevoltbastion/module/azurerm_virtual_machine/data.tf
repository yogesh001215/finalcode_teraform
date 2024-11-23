
data "azurerm_network_interface" "data-inc" {
  for_each            = var.VMS
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  
}

data "azurerm_key_vault" "data-keyvolt" {
  for_each = var.VMS
  name                = "uservm4"
  resource_group_name = each.value.rg_name
  
}
data "azurerm_key_vault_secret" "username" {
  for_each = var.VMS
  name         = each.value.datakey_user
  key_vault_id = data.azurerm_key_vault.data-keyvolt[each.key].id
}
data "azurerm_key_vault_secret" "userpassword" {
  for_each = var.VMS
  name         = each.value.datakey_pass
  key_vault_id = data.azurerm_key_vault.data-keyvolt[each.key].id
}

