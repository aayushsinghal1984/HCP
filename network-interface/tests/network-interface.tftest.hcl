mock_provider "azurerm" {}

run "unit_validate_network_interface_configuration" {

  command = plan

  #Resource mapping validation

  assert {
    condition     = azurerm_network_interface.nic.name == var.name
    error_message = "Network Interface name did not match as expected."
  }

  assert {
    condition     = azurerm_network_interface.nic.resource_group_name == var.resource_group_name
    error_message = "Resource Group name did not match as expected.."
  }

  assert {
    condition     = lower(azurerm_network_interface.nic.location) == lower(replace(var.location, " ", ""))
    error_message = "Location did not match as expected."
  }

  #IP Configuration validation

  assert {
    condition     = length(azurerm_network_interface.nic.ip_configuration) == length(var.ip_configurations)
    error_message = "IP configuration count did not match as expected."
  }

  assert {
    condition     = azurerm_network_interface.nic.ip_configuration[0].name == var.ip_configurations[0].name
    error_message = "IP configuration name did not match as expected."
  }

  assert {
    condition     = azurerm_network_interface.nic.ip_configuration[0].private_ip_address_allocation == var.ip_configurations[0].private_ip_address_allocation
    error_message = "Private IP allocation did not match as expected."
  }

  assert {
    condition = var.ip_configurations[0].private_ip_address == null || (
      azurerm_network_interface.nic.ip_configuration[0].private_ip_address == var.ip_configurations[0].private_ip_address
    )
    error_message = "Private IP address did not match as expected."
  }

  assert {
    condition = var.ip_configurations[0].subnet_id == null || (
      azurerm_network_interface.nic.ip_configuration[0].subnet_id == var.ip_configurations[0].subnet_id
    )
    error_message = "Subnet ID did not match as expected."
  }

  assert {
    condition     = azurerm_network_interface.nic.dns_servers == var.dns_servers
    error_message = "DNS servers did not match as expected."
  }

  assert {
    condition = length(var.dns_servers) == 0 || alltrue([
      for ip in var.dns_servers :
      can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "DNS server IP did not match as expected."
  }

  #Feature flags validation

  assert {
    condition     = azurerm_network_interface.nic.accelerated_networking_enabled == var.accelerated_networking_enabled
    error_message = "Accelerated networking flag did not match as expected."
  }

  assert {
    condition     = azurerm_network_interface.nic.ip_forwarding_enabled == var.ip_forwarding_enabled
    error_message = "IP forwarding flag did not match as expected."
  }


  assert {
    condition = var.internal_dns_name_label == null || (
      azurerm_network_interface.nic.internal_dns_name_label == var.internal_dns_name_label
    )
    error_message = "Internal DNS name label did not match as expected."
  }

  assert {
    condition     = can(regex("^nic-[a-z0-9]+-(dev|test|prod)-[a-z0-9]+-[0-9]{3}$", var.name))
    error_message = "Network Interface name does not follow enterprise naming convention: nic-<application>-<environment>-<region>-<instance_number>."
  }

  assert {
    condition     = length(var.name) <= 80
    error_message = "Network Interface name too long."
  }

  #IP configuration validation rules

  assert {
    condition = alltrue([
      for config in var.ip_configurations :
      config.private_ip_address_allocation == "Dynamic" ||
      (config.private_ip_address_allocation == "Static" && config.private_ip_address != null)
    ])
    error_message = "Private IP allocation configuration did not match as expected."
  }

  assert {
    condition = alltrue([
      for config in var.ip_configurations :
      config.private_ip_address_version == "IPv4" ||
      config.private_ip_address_version == "IPv6"
    ])
    error_message = "IP version did not match as expected."
  }

  #Mandatory tags (same as VNet enterprise rule)

  assert {
    condition = length(var.tags) == 0 || alltrue([
      contains(keys(var.tags), "Environment"),
      contains(keys(var.tags), "Application"),
      contains(keys(var.tags), "Owner"),
      contains(keys(var.tags), "CostCenter")
    ])
    error_message = "Missing mandatory tags."
  }

  #Tag value validations

  assert {
    condition     = length(var.tags) == 0 || contains(["dev", "test", "prod"], lower(var.tags["Environment"]))
    error_message = "Invalid Environment tag."
  }

  assert {
    condition     = length(var.tags) == 0 || can(regex("^[A-Z]{2,5}-[0-9]{4,6}$", var.tags["CostCenter"]))
    error_message = "Invalid CostCenter format."
  }

  assert {
    condition     = length(var.tags) == 0 || length(trimspace(var.tags["Owner"])) > 0
    error_message = "Owner cannot be empty."
  }

}