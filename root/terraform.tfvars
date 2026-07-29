resource_group_name = "rg-dev-001"
location            = "Central India"
vnet_name           = "vnet-dev"
vnet_address_space  = ["10.0.0.0/16"]
subnet_name         = "subnet-app"
subnet_prefixes     = ["10.0.1.0/24"]
nsg_name            = "nsg-dev"
nsg_rule_name       = "allow-ssh"
route_table_name    = "rt-app-test-eastus-001"
tags = {
  Environment = "Dev"
  ManagedBy   = "Terraform"
  Owner       = "Aayush"
}