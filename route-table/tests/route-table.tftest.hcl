mock_provider "azurerm" {}

run "unit_validate_route_table_configuration" {

  command = plan

  assert {
    condition     = azurerm_route_table.route_table.name == var.route_table_name
    error_message = "Route Table name mismatch."
  }

  assert {
    condition     = azurerm_route_table.route_table.location == var.route_table_location
    error_message = "Location mismatch."
  }

  assert {
    condition     = azurerm_route_table.route_table.resource_group_name == var.resource_group_name
    error_message = "Resource Group name mismatch."
  }

  assert {
    condition     = can(regex("^rt-(dev|test|prod)-[a-z0-9]+-[0-9]{3}$", var.route_table_name))
    error_message = "Route Table naming convention is invalid."
  }

  assert {
    condition     = length(var.tags) > 0
    error_message = "At least one tag should be defined."
  }

  assert {
    condition = alltrue([
      contains(keys(var.tags), "Environment"),
      contains(keys(var.tags), "Application"),
      contains(keys(var.tags), "Owner"),
      contains(keys(var.tags), "CostCenter")
    ])
    error_message = "Missing mandatory tags."
  }

  assert {
    condition = contains(
      ["dev", "test", "prod"],
      lower(var.tags["Environment"])
    )
    error_message = "Invalid Environment tag."
  }

  assert {
    condition     = can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.tags["CostCenter"]))
    error_message = "Invalid CostCenter format."
  }

  assert {
    condition     = length(trimspace(var.tags["Owner"])) > 0
    error_message = "Owner cannot be empty."
  }
}