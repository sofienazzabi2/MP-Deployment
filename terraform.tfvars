resource_group_name = "azure-resource-group" # Update: Name of your Azure resource group
location            = "westeurope" # Update: Azure region for resources
cluster_name        = "mp-deployment" # Update: Name of the Kubernetes cluster
kubernetes_version  = "1.27.9" # Update: Desired Kubernetes version for AKS
system_node_count   = 2 # Optional: Adjust the number of AKS worker nodes
