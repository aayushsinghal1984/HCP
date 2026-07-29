module "subnet_route_table_association" {
  source = "../"

  subnet_id      = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-app-test-eastus-001/subnets/snet-app-test-eastus-001"
  route_table_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/routeTables/rt-app-test-eastus-001"
}
