
output "resource_group_name" {
  description = "The Resource Group name."
  value       = azurerm_resource_group.resource_group.name
}

output "resource_group_id" {
  description = "The Resource Group ID."
  value       = azurerm_resource_group.resource_group.id
}