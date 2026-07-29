resource "azurerm_virtual_network" "virtual_network" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.virtual_network_address_space
  dns_servers         = var.virtual_network_dns_servers
  tags                = var.virtual_network_tags
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [1] : []
    content {
      enable = var.ddos_protection_enable
      id     = var.ddos_protection_plan_id
    }
  }
}