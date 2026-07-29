name                = "nic-app-test-eastus-001"
resource_group_name = "rg-app-test-eastus-001"
location            = "eastus"

ip_configurations = [
  {
    name                          = "ipconfig-app-test-eastus-001"
    subnet_id                     = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-app-test-eastus-001/subnets/snet-app-test-eastus-001"
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Dynamic"
    primary                       = true
    public_ip_address_id          = null
  }
]

dns_servers = ["10.0.0.4", "10.0.0.5"]

edge_zone               = null
internal_dns_name_label = "nic-app-test"

accelerated_networking_enabled = false
ip_forwarding_enabled          = false

tags = {
  Environment = "test"
  Application = "app"
  Owner       = "ulsc-nic"
  CostCenter  = "ULS-12345"
}