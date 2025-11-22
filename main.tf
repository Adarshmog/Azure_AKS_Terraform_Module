module "resource_group" {
  source      = "./modules/resource_group"
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  rg_name             = module.resource_group.rg_name
  rg_location         = module.resource_group.rg_location
}

module "aks" {
  source      = "./modules/aks"

  aks_name    = var.aks_name
  dns_prefix  = var.dns_prefix

  rg_name     = module.resource_group.rg_name
  location    = module.resource_group.rg_location
  subnet_id   = module.network.subnet_id

  node_pool_name = var.node_pool_name
  vm_size        = var.vm_size
  node_count     = var.node_count
}
