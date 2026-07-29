module "resource_group" {
  source = "../resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
  resource_group_tags = var.tags
}

module "virtual_network" {
  source = "../virtual-network"
  name                          = var.vnet_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  virtual_network_address_space = var.vnet_address_space
  virtual_network_dns_servers   = []
  virtual_network_tags          = var.tags
  depends_on = [module.resource_group]
}

module "subnet" {
  source = "../subnet"
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_prefixes
  depends_on = [module.virtual_network]
}

module "network_security_group" {
  source = "../network-security-group"

  network_security_group_name                = var.nsg_name
  network_security_group_resource_group_name = var.resource_group_name
  network_security_group_location            = var.location
  network_security_group_tags                = var.tags
  depends_on = [module.resource_group]
}

module "network_security_rule" {
  source = "../network-security-rule"
  network_security_rule_name = var.nsg_rule_name
  network_security_group_name          = var.nsg_name
  network_security_resource_group_name = var.resource_group_name
  network_security_group_rule_access      = "Allow"
  network_security_group_rule_priority    = 100
  network_security_group_rule_direction   = "Inbound"
  network_security_group_rule_protocol    = "Tcp"
  network_security_group_rule_source_address_prefix      = "*"
  network_security_group_rule_destination_address_prefix = "*"
  network_security_group_rule_source_port_range = "*"
  network_security_group_destination_port_range = "22"
  depends_on = [module.network_security_group]
}


module "route_table" {
  source = "../route-table"
  route_table_name                    = var.route_table_name
  route_table_location                = var.location
  resource_group_name                 = var.resource_group_name
  route_table_disable_bgp_route_propagation = false
  tags                                = var.tags
  depends_on = [
    module.resource_group
  ]
}
module "subnet_route_table_association" {
  source = "../subnet-route-table-association"
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.route_table.route_table_id
  depends_on = [
    module.subnet,
    module.route_table
  ]
}


