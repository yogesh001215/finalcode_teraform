
module "RG" {
  source = "../../module/azurerm_resource_group"
  VMS    = var.VM1
}
module "VNET" {
  source     = "../../module/azurerm_virtual_network"
  VMS        = var.VM1
  depends_on = [module.RG]
}
module "Subnet" {
  source     = "../../module/azurerm_subnet"
  VMS        = var.VM1
  depends_on = [module.VNET]
}
module "nic" {
  source     = "../../module/azurerm_netwok_interface"
  VMS        = var.VM1
  depends_on = [module.Subnet] 
}




module "virtual-machine" {
  source     = "../../module/azurerm_virtual_machine"
  VMS        = var.VM1
  depends_on = [module.nic]

}




