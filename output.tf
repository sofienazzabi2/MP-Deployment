output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id # No update needed
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn # No update needed
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group # No update needed
}

# Renommé la ressource pour éviter les duplications
resource "local_file" "kubeconfig_output" {
  filename = "kubeconfig" # Optional: Update the output file name if needed
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
}
