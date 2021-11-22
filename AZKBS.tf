resource "azurerm_kubernetes_cluster" "PRJ2ACS1" {
  name                = "${var.prefix}aks1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "Prj2Aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.PRJ2ACS1.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.PRJ2ACS1.kube_config_raw

  sensitive = true
}
