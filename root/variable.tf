variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_address_space" {}

variable "tags" {
  type = map(string)
}
variable "ARM_SUBSCRIPTION_ID" {
  type = string
}

variable "ARM_TENANT_ID" {
  type = string
}
