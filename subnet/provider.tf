terraform {
  required_version = ">= 1.15.0"

  cloud {
    organization = "TF-INFRA-ORG"

    workspaces {
      name = "subnet-workspace"
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
  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
}
