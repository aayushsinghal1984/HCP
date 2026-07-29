# Azure Network Security Group Terraform Module

This Terraform module creates an Azure Network Security Group (NSG) with customizable name, location, resource group, and tags.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.13.0 |
| azurerm | >= 4.23.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 4.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.NSG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name                                         | Description                                                           | Type          | Default | Required |
|----------------------------------------------|-----------------------------------------------------------------------|---------------|---------|----------|
| `network_security_group_name`                | Enter the name for the network security group.                        | `string`      | n/a     | yes      |
| `network_security_group_resource_group_name` | Enter the existing resource group name for the network security group.| `string`      | n/a     | yes      |
| `network_security_group_location`            | Enter the location for the network security group deployment.         | `string`      | n/a     | yes      |
| `network_security_group_tags`                | Enter the tags for the network security group.                        | `map(string)` | `{}`    | no       |

## Outputs

| Name                        | Description                           |
|-----------------------------|---------------------------------------|
| `network_security_group_id` | The ID of the network security group. |

## Example

```hcl
module "network_security_group" {
  source = "./path/to/module"

  network_security_group_name                = "nsg-test-eastus-001"
  network_security_group_resource_group_name = "rg-test-eastus-001"
  network_security_group_location            = "eastus"

  network_security_group_tags = {
    Environment  = "test"
    Application  = "app"
    Owner      = "ul-network-security-group"
    CostCenter = "ULS-12345"
  }
}
```
