resource "azurerm_subnet" "azurerm_subnet" {
  for_each             = var.VMS
  name                 = each.value.Subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.VNet_name
  address_prefixes     = each.value.address_prefixes
}
