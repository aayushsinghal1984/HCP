route_table_name                       = "rt-test-eastus-001"
route_table_location                   = "East US"
resource_group_name                    = "rg-test-eastus-001"

route_table_disable_bgp_route_propagation = false

tags = {
  Environment = "test"
  Application = "network"
  Owner       = "CloudTeam"
  CostCenter  = "IT-1234"
}