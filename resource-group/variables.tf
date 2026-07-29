variable "location" {
  type        = string
  description = "Location for Resource Group deployment"
}

variable "resource_group_tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the resource group"
}
variable "resource_group_name" {
  type        = string
  description = "The name for resource group"
}

