variable "location" {
  type        = string
  description = "Location for Resource Group deployment"
}
variable "resource_group_name" {
  type        = string
  description = "Name for Resource Group "
}

variable "tags" {
  type        = map(string)
  description = "tag Resource Group"
}

