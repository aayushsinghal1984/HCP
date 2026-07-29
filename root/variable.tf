variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnet_name" {}
variable "subnet_prefixes" {}
variable "nsg_name" {}
variable "nsg_rule_name" {}
variable "route_table_name" {}
variable "tags" {
  type = map(string)
}