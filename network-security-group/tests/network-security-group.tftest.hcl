mock_provider "azurerm" {}

run "unit_validate_network_security_group_configuration" {

  command = plan

  assert {
    condition     = azurerm_network_security_group.NSG.name == var.network_security_group_name
    error_message = "Network Security Group name did not match as expected."
  }

  assert {
    condition     = azurerm_network_security_group.NSG.resource_group_name == var.network_security_group_resource_group_name
    error_message = "Resource Group name did not match as expected."
  }

  assert {
    condition     = azurerm_network_security_group.NSG.location == var.network_security_group_location
    error_message = "Location did not match as expected."
  }

  assert {
    condition     = can(regex("^nsg-[a-z0-9]+-(dev|test|prod)-[a-z0-9]+-[0-9]{3}$", var.network_security_group_name))
    error_message = "Network Security Group name does not follow enterprise naming convention: nsg-<application>-<environment>-<region>-<instance_number>."
  }

  assert {
    condition     = length(var.network_security_group_name) <= 80
    error_message = "Network Security Group name too long."
  }

  # Mandatory tag validation

  assert {
    condition = alltrue([
      contains(keys(var.network_security_group_tags), "Environment"),
      contains(keys(var.network_security_group_tags), "Application"),
      contains(keys(var.network_security_group_tags), "Owner"),
      contains(keys(var.network_security_group_tags), "CostCenter")
    ])
    error_message = "Missing mandatory tags."
  }

  # Tag values validation

  assert {
    condition     = contains(["dev", "test", "prod"], lower(var.network_security_group_tags["Environment"]))
    error_message = "Invalid Environment tag."
  }

  assert {
    condition     = can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.network_security_group_tags["CostCenter"]))
    error_message = "Invalid CostCenter format."
  }

  assert {
    condition     = length(trimspace(var.network_security_group_tags["Owner"])) > 0
    error_message = "Owner cannot be empty."
  }


  assert {
    condition     = can(regex("^nsg-", var.network_security_group_name))
    error_message = "NSG name must start with 'nsg-' prefix."
  }


  assert {
    condition     = length(trimspace(var.network_security_group_resource_group_name)) > 0
    error_message = "Resource Group name cannot be empty."
  }

  assert {
    condition     = azurerm_network_security_group.NSG.tags == var.network_security_group_tags
    error_message = "Tags on the NSG resource did not match the input tags variable."
  }

}
