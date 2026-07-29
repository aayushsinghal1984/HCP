# Azure Route Table Terraform Module

This Terraform module creates an Azure Route Table with customizable BGP route propagation settings and tags.

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
| [azurerm_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `route_table_name` | The name of the route table. | `string` | n/a | yes |
| `route_table_location` | The location where the route table needs to be created. | `string` | n/a | yes |
| `resource_group_name` | The name of the resource group in which to create the route table. | `string` | n/a | yes |
| `route_table_disable_bgp_route_propagation` | Boolean flag which controls propagation of routes learned by BGP on that route table. | `bool` | `true` | no |
| `tags` | Tags for route table if any. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `route_table_id` | The ID of the route table. |
| `route_table_name` | The name of the route table. |
| `route_tabvle_location` | The location of the route table. |
| `route_table_disable_bgp_route_propagation` | The BGP route propagation setting of the route table. |

## Example

module "route_table" {
  source = "../"

  route_table_name     = "rt-test-eastus-001"
  route_table_location = "East US"

  resource_group_name = "rg-test-eastus-001"

  route_table_disable_bgp_route_propagation = false

  tags = {
    Environment = "test"
    Application = "network"
    Owner       = "CloudTeam"
    CostCenter  = "IT-1234"
  }
}
