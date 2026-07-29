# Azure Network Interface Module

This Terraform module creates an Azure Network Interface with customizable settings, including IP configurations, DNS servers, and optional features like accelerated networking and IP forwarding.

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
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name                          | Description                                                                 | Type          | Default       | Required |
|-------------------------------|-----------------------------------------------------------------------------|---------------|---------------|----------|
| `name`                        | Specifies the name of the Network Interface.                                | `string`      | n/a           | yes      |
| `resource_group_name`         | Specifies the name of the resource group in which the Network Interface is created. | `string`      | n/a           | yes      |
| `location`                    | Specifies the supported Azure location where the resource exists.           | `string`      | n/a           | yes      |
| `ip_configurations`           | A list of IP configurations for the Network Interface.                      | `list(object)`| n/a           | yes      |
| `accelerated_networking_enabled` | Should Accelerated Networking be enabled?                                | `bool`        | `false`       | no       |
| `ip_forwarding_enabled`       | Should IP Forwarding be enabled?                                             | `bool`        | `false`       | no       |
| `dns_servers`                 | List of DNS servers IP addresses to use for this Network Interface.         | `list(string)`| `[]`          | no       |
| `edge_zone`                   | Specifies the Edge Zone within the Azure Region where this Network Interface should exist. | `string` | `null`   | no       |
| `internal_dns_name_label`     | The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `string` | `null` | no |
| `tags`                        | A mapping of tags to assign to the resource.                                | `map(string)` | `{}`          | no       |

## Outputs

| Name                                | Description                                                                 |
|-------------------------------------|-----------------------------------------------------------------------------|
| `network_interface_id`              | The ID of the Network Interface.                                            |
| `network_interface_private_ip_addresses` | The list of private IP addresses assigned to the Network Interface.   |
| `network_interface_mac_address`     | The MAC address of the Network Interface.                                   |
| `network_interface_private_ip_address` | The primary private IP address assigned to the Network Interface.       |

## Example

```hcl
module "network_interface" {
  source = "../"

  name                = "nic-app-test-eastus-001"
  location            = "eastus"
  resource_group_name = "rg-app-test-eastus-001"

  dns_servers                    = ["10.0.0.4", "10.0.0.5"]
  edge_zone                      = null
  accelerated_networking_enabled = false
  ip_forwarding_enabled          = false
  internal_dns_name_label        = "nic-app-test"

  ip_configurations = [
    {
      name                          = "ipconfig-app-test-eastus-001"
      subnet_id                     = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-app-test-eastus-001/subnets/snet-app-test-eastus-001"
      private_ip_address_version    = "IPv4"
      private_ip_address_allocation = "Dynamic"
      private_ip_address            = null
      primary                       = true
      public_ip_address_id          = null
    }
  ]

  tags = {
    Environment = "test"
    Application = "app"
  }
}
```
