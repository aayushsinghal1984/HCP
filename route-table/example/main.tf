module "route_table" {
  source = "../"

  route_table_name     = "rt-app-test-eastus-001"
  route_table_location = "eastus"

  resource_group_name = "rg-app-test-eastus-001"

  route_table_disable_bgp_route_propagation = false

  tags = {
    Environment = "test"
    Application = "app"
    Owner       = "CloudTeam"
    CostCenter  = "IT-1234"
  }
}