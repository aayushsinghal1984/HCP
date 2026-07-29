variable "network_security_group_name" {
  type        = string
  description = "Enter the Name for network security group"
}
variable "network_security_group_tags" {
  type        = map(string)
  default     = {}
  description = "Enter the tags for network security groups"
}
variable "network_security_group_location" {
  type        = string
  description = "Enter the Location for network security group deployment"
}
variable "network_security_group_resource_group_name" {
  type        = string
  description = "Enter the existsing resource group name for network secruity group"
}