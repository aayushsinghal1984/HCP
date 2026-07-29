terraform {
  required_version = ">= 1.15.0"

  cloud {
    organization = "ULRI-ULSE"

    workspaces {
      name = "state-virtual-network"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.70.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}
