module "resource_group" {
  source = "../"

  resource_group_name = "rg-app-test-eastus-001"
  location            = "eastus"
  resource_group_tags = {
    Environment = "test"
    Application = "ulse"
    Owner       = "ulse-team"
    CostCenter  = "ULS-12345"
  }
}
