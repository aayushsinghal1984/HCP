network_security_rule_name           = "nsr-app-test-eastus-001"
network_security_group_name          = "nsg-app-test-eastus-001"
network_security_resource_group_name = "rg-app-test-eastus-001"

network_security_group_rule_access   = "Allow"
network_security_group_rule_priority = 100

network_security_group_rule_direction = "Inbound"
network_security_group_rule_protocol  = "Tcp"

network_security_group_rule_source_address_prefix   = "*"
network_security_group_rule_source_address_prefixes = null

network_security_group_rule_destination_address_prefix   = "*"
network_security_group_rule_destination_address_prefixes = null

network_security_group_rule_source_port_range  = "*"
network_security_group_rule_source_port_ranges = null

network_security_group_destination_port_range  = "443"
network_security_group_destination_port_ranges = null