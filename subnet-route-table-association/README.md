Requirements# Azure Subnet Route Table Association Terraform Module

This Terraform module creates an Azure Subnet Route Table Association, linking a Route Table to a Subnet.

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
| [azurerm_subnet_route_table_association.route_table_subnet_Association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `subnet_id` | The ID of the Subnet. | `string` | n/a | yes |
| `route_table_id` | The ID of the Route Table. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `subnet_route_table_association_id` | The ID of the subnet route table association. |
| `subnet_id` | The ID of the subnet. |
| `route_table_id` | The ID of the route table. |

## Example

module "subnet_route_table_association" {
  source = "../"

  subnet_id      = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-app-test-eastus-001/subnets/snet-app-test-eastus-001"
  route_table_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/routeTables/rt-app-test-eastus-001"
}
