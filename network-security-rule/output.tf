
output "network_security_rule_id" {
  description = "The ID of the network security rule"
  value       = azurerm_network_security_rule.nsg_rules.id
}