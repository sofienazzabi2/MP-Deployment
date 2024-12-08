# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name # Update: Ensure this matches your resource group
  location = var.location 
}

# Kubernetes Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name 
  kubernetes_version  = var.kubernetes_version 
  location            = var.location # Update: Ensure this matches your desired Azure region
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.cluster_name # Optional: Update for a custom DNS prefix

  default_node_pool {
    name                = "system" # Optional: Update the pool name if needed
    node_count          = var.system_node_count # Optional: Adjust node count based on load
    vm_size             = "Standard_B2ms" # Optional: Change the VM size based on performance needs
    type                = "VirtualMachineScaleSets"
    zones               = [1, 2, 3] # Optional: Update based on the desired availability zones
    enable_auto_scaling = false # Optional: Enable autoscaling if required
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard" # Optional: Use "basic" if cost savings are a priority
    network_plugin    = "kubenet" # Optional: Use "azure" for a CNI network plugin
  }
}

# Output kubeconfig for kubectl
resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.aks]
  filename     = "kubeconfig" # Optional: Update the output file name if needed
  content      = azurerm_kubernetes_cluster.aks.kube_config_raw
}
