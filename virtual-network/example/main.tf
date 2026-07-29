resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "ddos-plan-01"
  location            = "eastus"
  resource_group_name = "rg-app-test-eastus-001"
}

module "virtual_network" {
  source = "../"

  name                = "vnet-app-test-eastus-001"
  resource_group_name = "rg-app-test-eastus-001"
  location            = "eastus"

  virtual_network_address_space = ["10.0.0.0/16"]

  virtual_network_dns_servers = [
    "8.8.8.8",
    "8.8.4.4"
  ]

  virtual_network_tags = {
    Environment = "test"
    Application = "app"
    Owner       = "network-team"
    CostCenter  = "ULS-12345"
  }

  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  ddos_protection_enable  = true
}

module "virtual_network_02" {
  source = "../"

  name                = "vnet-app-test-eastus-002"
  resource_group_name = "rg-app-test-eastus-001"
  location            = "eastus"

  virtual_network_address_space = ["10.1.0.0/16"]

  virtual_network_dns_servers = [
    "8.8.8.8",
    "8.8.4.4"
  ]

  virtual_network_tags = {
    Environment = "test"
    Application = "app"
    Owner       = "network-team"
    CostCenter  = "ULS-12345"
  }

  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  ddos_protection_enable  = true
}