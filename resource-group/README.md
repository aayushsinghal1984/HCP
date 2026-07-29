# Azure Resource Group Module

This Terraform module creates an Azure Resource Group with customizable settings, including name, location, and tags.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.15.0 |
| azurerm | >= 4.70.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 4.70.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `resource_group_name` | The name of the resource group. | `string` | n/a | yes |
| `location` | Location for Resource Group deployment. | `string` | n/a | yes |
| `resource_group_tags` | Tags for the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `resource_group_id` | The ID of the resource group. |

## Example

```hcl
module "resource_group" {
  source = "../"

  resource_group_name = "rg-myapp-test-eastus-001"
  location            = "eastus"

  resource_group_tags = {
    Environment        = "test"
    Application        = "myapp"
    Owner              = "platform-team"
    CostCenter         = "ULS-12345"
    
  }
}

