resource "azurerm_virtual_network" "azurerm_virtual_network" {
  for_each            = var.VMS
  name                = each.value.VNet_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  #   dns_servers         = ["10.0.0.4", "10.0.0.5"] optional
}
