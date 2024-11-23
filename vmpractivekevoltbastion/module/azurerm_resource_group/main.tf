resource "azurerm_resource_group" "resource-group" {
    for_each = var.VMS
    name = each.value.rg_name
    location = each.value.location
  
}