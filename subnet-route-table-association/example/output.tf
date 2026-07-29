output "subnet_route_table_association_id" {
  description = "The ID of the subnet route table association."
  value       = module.subnet_route_table_association.subnet_route_table_association_id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = module.subnet_route_table_association.subnet_id
}

output "route_table_id" {
  description = "The ID of the route table."
  value       = module.subnet_route_table_association.route_table_id
}
