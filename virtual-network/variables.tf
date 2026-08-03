variable "name" {
  type        = string
  description = "Name of the virtual network"
}
variable "resource_group_name" {
  type        = string
  description = "The resource group where virtual network needs to be deployed"
}
variable "location" {
  type        = string
  description = "The location where virtual network needs to be deployed"
}
variable "virtual_network_address_space" {
  type        = list(string)
  description = "Enter the address space of virtual network."
 
}


