output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.subnet.subnet_id
}

output "subnet_name" {
  description = "The name of the Subnet"
  value       = module.subnet.subnet_name
}

output "subnet_resource_group_name" {
  description = "The resource group of the Subnet"
  value       = module.subnet.subnet_resource_group_name
}

output "subnet_virtual_network_name" {
  description = "The Virtual Network name where Subnet is created"
  value       = module.subnet.subnet_virtual_network_name
}

output "subnet_address_prefixes" {
  description = "Address prefixes of the Subnet"
  value       = module.subnet.subnet_address_prefixes
}
