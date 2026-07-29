output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "route_table_id" {
  value = azurerm_route_table.route_table.id
}
output "nsg_id" {
value = azurerm_network_security_group.NSG.id
}