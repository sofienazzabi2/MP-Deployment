variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name" # No update needed
}

variable "location" {
  type        = string
  description = "Azure region for resources" # No update needed
}

variable "cluster_name" {
  type        = string
  description = "Name of the AKS cluster" # No update needed
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for AKS" # No update needed
}

variable "system_node_count" {
  type        = number
  description = "Number of worker nodes in the cluster" # No update needed
}
