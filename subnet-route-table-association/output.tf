output "subnet_route_table_association_id" {
  description = "The ID of the subnet route table association."
  value       = azurerm_subnet_route_table_association.route_table_subnet_Association.id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet_route_table_association.route_table_subnet_Association.subnet_id
}

output "route_table_id" {
  description = "The ID of the route table."
  value       = azurerm_subnet_route_table_association.route_table_subnet_Association.route_table_id
}
