terraform {
  required_version = ">= 1.15.0"

  cloud {
    organization = "UL-Terrafrom"

    workspaces {
      name = "nsg-rule-workspace"
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
  use_oidc        = true
}
