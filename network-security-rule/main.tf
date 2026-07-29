resource "azurerm_network_security_rule" "nsg_rules" {
  name                         = var.network_security_rule_name
  network_security_group_name  = var.network_security_group_name
  resource_group_name          = var.network_security_resource_group_name
  access                       = var.network_security_group_rule_access
  priority                     = var.network_security_group_rule_priority
  source_address_prefix        = var.network_security_group_rule_source_address_prefix
  source_address_prefixes      = var.network_security_group_rule_source_address_prefixes
  destination_address_prefix   = var.network_security_group_rule_destination_address_prefix
  destination_address_prefixes = var.network_security_group_rule_destination_address_prefixes
  source_port_range            = var.network_security_group_rule_source_port_range
  source_port_ranges           = var.network_security_group_rule_source_port_ranges
  direction                    = var.network_security_group_rule_direction
  protocol                     = var.network_security_group_rule_protocol
  destination_port_range       = var.network_security_group_destination_port_range
  destination_port_ranges      = var.network_security_group_destination_port_ranges

}