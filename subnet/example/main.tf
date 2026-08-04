terraform {
  required_version = ">= 1.15.0"

  cloud {
    organization = "ULRI-ULSE"

    workspaces {
      name = "subnet-workspace"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}



module "subnet" {
  source = "../"

  name                 = "snet-dns-outbound-endpoint"
  resource_group_name  = "rg-app-test-eastus-001"
  virtual_network_name = "vnet-app-test-eastus-001"

  address_prefixes = ["10.0.2.0/27"]

  default_outbound_access_enabled               = true
  private_endpoint_network_policies             = "Enabled"
  private_link_service_network_policies_enabled = true

  service_endpoints = []

  service_endpoint_policy_ids = []

  delegations = []
}


