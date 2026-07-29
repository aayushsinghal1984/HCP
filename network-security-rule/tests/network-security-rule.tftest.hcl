mock_provider "azurerm" {}

run "unit_validate_network_security_rule_configuration" {

  command = plan

  assert {
    condition     = azurerm_network_security_rule.nsg_rules.name == var.network_security_rule_name
    error_message = "Network Security Rule name mismatch."
  }

  assert {
    condition     = azurerm_network_security_rule.nsg_rules.network_security_group_name == var.network_security_group_name
    error_message = "Network Security Group name mismatch."
  }

  assert {
    condition     = azurerm_network_security_rule.nsg_rules.resource_group_name == var.network_security_resource_group_name
    error_message = "Resource Group name mismatch."
  }

  # Naming convention validation
  # Expected: nsr-<division>-<env>-<region>-<instance>
  # Example: nsr-app-test-eastus-001

  assert {
    condition     = can(regex("^nsr-[a-z0-9]+-(dev|test|prod)-[a-z0-9]+-[0-9]{3}$", var.network_security_rule_name))
    error_message = "Invalid Network Security Rule naming convention."
  }

  assert {
    condition     = contains(["Allow", "Deny"], var.network_security_group_rule_access)
    error_message = "Access must be Allow or Deny."
  }

  assert {
    condition     = contains(["Inbound", "Outbound"], var.network_security_group_rule_direction)
    error_message = "Direction must be Inbound or Outbound."
  }

  assert {
    condition     = contains(["Tcp", "Udp", "Icmp", "*"], var.network_security_group_rule_protocol)
    error_message = "Invalid protocol value."
  }

  assert {
    condition     = var.network_security_group_rule_priority >= 100 && var.network_security_group_rule_priority <= 4096
    error_message = "Priority must be between 100 and 4096."
  }

  assert {
    condition = (
      var.network_security_group_rule_source_address_prefix != null ||
      length(coalesce(var.network_security_group_rule_source_address_prefixes, [])) > 0
    )
    error_message = "Source address prefix or prefixes must be specified."
  }

  assert {
    condition = (
      var.network_security_group_rule_destination_address_prefix != null ||
      length(coalesce(var.network_security_group_rule_destination_address_prefixes, [])) > 0
    )
    error_message = "Destination address prefix or prefixes must be specified."
  }
}
