# Variables for conditional logic
variable "create_resources" {
  default = true
}

# Check if the Resource Group exists
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  count    = var.create_resources && data.azurerm_resource_group.existing_rg.id == "" ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}

# Check if the Kubernetes Cluster exists
data "azurerm_kubernetes_cluster" "existing_aks" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}

# Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  count               = var.create_resources && data.azurerm_kubernetes_cluster.existing_aks.id == "" ? 1 : 0
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_B2ms"
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3]
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }
}

# Output kubeconfig for kubectl
resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.aks.kube_config_raw
}
