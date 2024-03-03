resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.name_prefix}-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.name_prefix}-ask-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix = var.dns_prefix

  default_node_pool {
    name       = var.nodepool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Project = var.name_prefix
  }
}

