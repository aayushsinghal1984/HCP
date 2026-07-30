resource_group_name = "rg-dev-001"
location            = "Central India"
vnet_name           = "vnet-dev"
vnet_address_space  = ["10.0.0.0/16"]

tags = {
  Environment = "Dev"
  ManagedBy   = "Terraform"
  Owner       = "Aayush"
}