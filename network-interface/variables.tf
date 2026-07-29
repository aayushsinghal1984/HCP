variable "name" {
  description = "Specifies the name of the Network Interface."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the resource group in which the Network Interface is created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "ip_configurations" {
  description = "A list of IP configurations for the Network Interface."
  type = list(object({
    name                          = string
    subnet_id                     = optional(string)
    private_ip_address_version    = optional(string, "IPv4")
    private_ip_address_allocation = string
    private_ip_address            = optional(string)
    primary                       = optional(bool, false)
    public_ip_address_id          = optional(string)
  }))

  validation {
    condition = alltrue([
      for config in var.ip_configurations : (
        config.private_ip_address_allocation == "Dynamic" ||
        (config.private_ip_address_allocation == "Static" && config.private_ip_address != null)
      ) &&
      (config.subnet_id != null || config.private_ip_address_version != "IPv4") &&
      (config.private_ip_address_version == "IPv4" || config.private_ip_address_version == "IPv6") &&
      (config.primary == true || config.primary == false)
    ])
    error_message = "Each IP configuration must have a valid private_ip_address when private_ip_address_allocation is set to Static, subnet_id must be provided when private_ip_address_version is set to IPv4, and private_ip_address_version must be either IPv4 or IPv6."
  }
}

variable "dns_servers" {
  description = "List of DNS servers IP addresses to use for this Network Interface."
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for ip in var.dns_servers : can(cidrhost("${ip}/32", 0))
    ])
    error_message = "Each DNS server IP must be valid IPv4."
  }
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Network Interface should exist. Changing this forces a new Network Interface to be created."
  type        = string
  default     = null
}

variable "internal_dns_name_label" {
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "accelerated_networking_enabled" {
  description = "Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "ip_forwarding_enabled" {
  description = "IP Forwarding be enabled? Defaults to false"
  type        = bool
  default     = false
}