name                          = "vnet-app-test-eastus-001"
resource_group_name           = "rg-app-test-eastus-001"
location                      = "eastus"
virtual_network_address_space = ["10.0.0.0/16"]
virtual_network_dns_servers   = ["10.0.0.4", "10.0.0.5"]
virtual_network_tags = {
  Environment = "test"
  Application = "app"
  Owner       = "ulsc-nic"
  CostCenter  = "ULS-12345"
}
