terraform {
  required_version = ">= 1.13.0"

  cloud {
    organization = "ULRI-ULSE"

    workspaces {
      name = "state-network-security-group"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.23.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}
