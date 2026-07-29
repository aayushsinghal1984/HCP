resource "azurerm_route_table" "route_table" {
  name                          = var.route_table_name
  location                      = var.route_table_location
  resource_group_name           = var.resource_group_name
  bgp_route_propagation_enabled = var.route_table_disable_bgp_route_propagation
  tags                          = var.tags
}

