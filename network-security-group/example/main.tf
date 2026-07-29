module "network_security_group" {
  source = "../"

  network_security_group_name                = "nsg-app-test-eastus-001"
  network_security_group_resource_group_name = "rg-app-test-eastus-001"
  network_security_group_location            = "eastus"

  network_security_group_tags = {
    Environment = "test"
    Application = "app"
    Owner       = "ul-network-security-group"
    CostCenter  = "ULS-12345"
  }
}

