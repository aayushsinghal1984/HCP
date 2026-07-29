resource "azurerm_network_interface" "nic" {
  name                           = var.name
  location                       = var.location
  resource_group_name            = var.resource_group_name
  dns_servers                    = var.dns_servers
  edge_zone                      = var.edge_zone
  internal_dns_name_label        = var.internal_dns_name_label
  tags                           = var.tags
  ip_forwarding_enabled          = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled

  dynamic "ip_configuration" {
    for_each = { for idx, config in var.ip_configurations : idx => config }

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = ip_configuration.value.subnet_id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      private_ip_address_version    = ip_configuration.value.private_ip_address_version
      private_ip_address            = try(ip_configuration.value.private_ip_address, null)
      primary                       = try(ip_configuration.value.primary, false)
      public_ip_address_id          = try(ip_configuration.value.public_ip_address_id, null)
    }
  }
}