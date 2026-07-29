mock_provider "azurerm" {}

run "unit_validate_subnet_route_table_association_configuration" {

  command = plan

  # Resource Mapping Validation
  assert {
    condition     = azurerm_subnet_route_table_association.route_table_subnet_Association.subnet_id == var.subnet_id
    error_message = "Subnet ID did not match as expected."
  }

  assert {
    condition     = azurerm_subnet_route_table_association.route_table_subnet_Association.route_table_id == var.route_table_id
    error_message = "Route Table ID did not match as expected."
  }

  # Subnet ID Format Validation
  assert {
    condition     = can(regex(".*/virtualNetworks/.*/subnets/.*", var.subnet_id))
    error_message = "Invalid Subnet ID format."
  }

  # Route Table ID Format Validation
  assert {
    condition     = can(regex(".*/routeTables/.*", var.route_table_id))
    error_message = "Invalid Route Table ID format."
  }
}
