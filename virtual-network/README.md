# Azure Virtual Network Module

This Terraform module creates an Azure Virtual Network.

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
| [azurerm_virtual_network.virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name                                | Description                                      | Type   | Default | Required |
|-------------------------------------|--------------------------------------------------|--------|---------|----------|
| `virtual_network_name`              | The name of the virtual network.                 | string | n/a     | yes      |
| `virtual_network_resource_group_name` | The name of the resource group.                | string | n/a     | yes      |
| `virtual_network_location`          | The location/region where the virtual network will be created. | string | n/a     | yes      |
| `virtual_network_address_space`     | The address space for the virtual network.       | list(string) | n/a | yes   |
| `virtual_network_dns_servers`       | A list of DNS servers.                           | list(string) | `[]` | no  |
| `virtual_network_tags`              | A map of tags to assign to the resource.         | map(string) | `{}` | no  |
| `ddos_protection_enable`            | Boolean to enable or disable DDoS protection.    | bool   | `false` | no      |
| `ddos_protection_plan_id`           | The ID of the DDoS protection plan.              | string | `null`  | no      |

## Outputs

| Name                          | Description                                      |
|-------------------------------|--------------------------------------------------|
| `virtual_network_id`          | The ID of the created virtual network.           |
| `virtual_network_name`        | The name of the created virtual network.         |

## Example

```hcl
module "virtual_network" {
  source = "../"

  virtual_network_name                = "vnet-app-dev-eastus-001"
  virtual_network_resource_group_name = "rg-app-dev-eastus-001"
  virtual_network_location            = "East US"
  virtual_network_address_space       = ["10.0.0.0/16"]

  virtual_network_dns_servers = ["8.8.8.8", "8.8.4.4"]

  virtual_network_tags = {
    Environment  = "dev"
    Application  = "myapp"
    Owner      = "network-team"
    CostCenter = "ULS-12345"
  }

  ddos_protection_plan_id = null
  ddos_protection_enable  = false
}
```
