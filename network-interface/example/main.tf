module "network_interface" {
  source = "../"

  name                = "nic-app-test-eastus-001"
  location            = "eastus"
  resource_group_name = "rg-app-test-eastus-001"

  dns_servers                    = ["10.0.0.4", "10.0.0.5"]
  edge_zone                      = null
  accelerated_networking_enabled = false
  ip_forwarding_enabled          = false
  internal_dns_name_label        = "nic-app-test"

  ip_configurations = [
    {
      name                       = "ipconfig-app-test-eastus-001"
      subnet_id                  = "/subscriptions/3ea78c64-5afd-4b6c-ba34-b7884ce9d56e/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-app-test-eastus-001/subnets/snet-app-test-eastus-001"
      private_ip_address_version = "IPv4"

      private_ip_address_allocation = "Dynamic"
      private_ip_address            = null
      primary                       = true
      public_ip_address_id          = null
    }
  ]

  tags = {
    Environment = "test"
    Application = "app"
    Owner       = "ulsc-nic"
    CostCenter  = "ULS-12345"
  }
}