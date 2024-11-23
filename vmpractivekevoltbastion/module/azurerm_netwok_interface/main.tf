resource "azurerm_network_interface" "azurerm_network_interface" {
  for_each            = var.VMS
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.data-subnet[each.key].id
    private_ip_address_allocation = each.value.ip_configuration_private_ip_address_allocation
    
  }
}
data "azurerm_subnet" "data-subnet" {
  for_each             = var.VMS
  name                 = each.value.Subnet_name
  virtual_network_name = each.value.VNet_name
  resource_group_name  = each.value.rg_name
}
