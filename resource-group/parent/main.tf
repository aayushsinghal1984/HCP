module "resource_group_name" {
  source              = "../"
  resource_group_name = var.resource_group_name
  location            = var.location
  resource_group_tags = var.tags
}
