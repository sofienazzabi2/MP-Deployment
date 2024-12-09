output "aks_id" {
  value = azurerm_kubernetes_cluster.aks[0].id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks[0].fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks[0].node_resource_group
}

resource "local_file" "kubeconfig_output" {
  filename = "kubeconfig"
  content  = azurerm_kubernetes_cluster.aks[0].kube_config_raw
}

