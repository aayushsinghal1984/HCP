variable "network_security_group_name" {
  type        = string
  description = "The Existsing Network Security group Name"
}
variable "network_security_resource_group_name" {
  type        = string
  description = "The Existsing Resource Group Name where NSG is deployed"
}
variable "network_security_group_rule_access" {
  type        = string
  description = "The access type for network security group rule. Accepted values are Allow or Deny"
  validation {
    condition     = contains(["Allow", "Deny"], var.network_security_group_rule_access)
    error_message = "Either Allow or Deny value is allowed"
  }

}

variable "network_security_group_rule_priority" {
  type        = number
  description = "The priority value for the network security group rule"

  validation {
    condition     = var.network_security_group_rule_priority >= 100 && var.network_security_group_rule_priority <= 4096
    error_message = "The priority value must be between 100 and 4096."
  }
}

variable "network_security_group_rule_direction" {
  type        = string
  description = "The direction for the network security group rule direction"
  validation {
    condition     = contains(["Inbound", "Outbound"], var.network_security_group_rule_direction)
    error_message = "Either Inbound or Outbound value is allowed"
  }
}
variable "network_security_rule_name" {
  type        = string
  description = "The NSG rule name "
}

variable "network_security_group_rule_source_address_prefix" {
  type        = string
  description = "The source address prefix value. This parameter accepts a string value"
  default     = null
}

variable "network_security_group_rule_source_address_prefixes" {
  type        = list(string)
  default     = null
  description = "The source address prefixes values. This parameter accepts an array of values"
}

variable "network_security_group_rule_source_port_range" {
  type        = string
  default     = null
  description = "The source port range value. This parameter accepts a string value"

  validation {
    condition     = var.network_security_group_rule_source_port_range == null || can(regex("^([0-9]{1,5}(-[0-9]{1,5})?|\\*)$", var.network_security_group_rule_source_port_range))
    error_message = "The source port range must be an integer or range between 0 and 65535, or * to match any."
  }
}


variable "network_security_group_rule_source_port_ranges" {
  type        = list(string)
  default     = null
  description = "The source port range values. This parameter accepts an array of values"

  validation {
    condition     = var.network_security_group_rule_source_port_ranges == null || alltrue([for port in var.network_security_group_rule_source_port_ranges != null ? var.network_security_group_rule_source_port_ranges : [] : can(regex("^([0-9]{1,5}(-[0-9]{1,5})?|\\*)$", port))])
    error_message = "Each source port range must be an integer or range between 0 and 65535, or * to match any."
  }
}

variable "network_security_group_rule_protocol" {
  type        = string
  description = "The protocol for the NSG rule"

  validation {
    condition     = contains(["Tcp", "Udp", "Icmp", "Esp", "Ah", "*"], var.network_security_group_rule_protocol)
    error_message = "The protocol must be one of the following: Tcp, Udp, Icmp, Esp, Ah, or *."
  }
}

variable "network_security_group_rule_destination_address_prefix" {
  type        = string
  default     = null
  description = "The Destination address prefix value. This parameter accepts a string value"
}

variable "network_security_group_rule_destination_address_prefixes" {
  type        = list(string)
  default     = null
  description = "The Destination address prefixes values. This parameter accepts an array of values"
}

variable "network_security_group_destination_port_range" {
  type        = string
  default     = null
  description = "The Destination port range value. This parameter accepts a string value"

  validation {
    condition     = var.network_security_group_destination_port_range == null || can(regex("^([0-9]{1,5}(-[0-9]{1,5})?|\\*)$", var.network_security_group_destination_port_range))
    error_message = "The destination port range must be an integer or range between 0 and 65535, or * to match any."
  }
}

variable "network_security_group_destination_port_ranges" {
  type        = list(string)
  default     = null
  description = "The Destination port ranges values. This parameter accepts an array of values"

  validation {
    condition     = var.network_security_group_destination_port_ranges == null || alltrue([for port in var.network_security_group_destination_port_ranges != null ? var.network_security_group_destination_port_ranges : [] : can(regex("^([0-9]{1,5}(-[0-9]{1,5})?|\\*)$", port))])
    error_message = "Each destination port range must be an integer or range between 0 and 65535, or * to match any."
  }
}