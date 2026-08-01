module "resource_group" {
  source              = "../rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  resource_group_tags = var.tags
}

module "virtual_network" {
  depends_on                    = [module.resource_group]
  source                        = "../virtual-network"
  name                          = var.vnet_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  virtual_network_address_space = var.vnet_address_space
  virtual_network_dns_servers   = []
  virtual_network_tags          = var.tags

}
