variable "route_table_name" {
  description = "The name of the route table."
  type        = string
}

variable "route_table_location" {
  description = "The location where the route table needs to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table."
  type        = string
}

variable "route_table_disable_bgp_route_propagation" {
  type        = bool
  default     = true
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. Defaults to false"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for route table if any"
}