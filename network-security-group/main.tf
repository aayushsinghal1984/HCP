resource "azurerm_network_security_group" "NSG" {
  name                = var.network_security_group_name
  resource_group_name = var.network_security_group_resource_group_name
  location            = var.network_security_group_location
  tags                = var.network_security_group_tags
}