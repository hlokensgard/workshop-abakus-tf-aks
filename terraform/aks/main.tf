resource "azurerm_resource_group" "aks" {
  name     = random_pet.server.id
  location = "westeurope"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${azurerm_resource_group.aks.name}-aks"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "${azurerm_resource_group.aks.name}-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "test"
  }
}

# Creates a random pet name to be used in as resource group name
resource "random_pet" "server" {
  length = 3
}