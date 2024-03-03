variable "name_prefix" {
  type = string
  description = "Resource name prefix"
}

variable "aks_cluster_name" {
  type = string
  description = "AKS Cluster Name"
}

variable "location" {
  type = string
  description = "Location"
}

variable "node_count" {
  type = number
  description = "Total no. of nodes"
}

variable "vm_size" {
  type = string
  description = "Size of the VM for AKS Cluster Node"
}

variable "dns_prefix" {
  type = string
  description = "Dns prifix name"
}

variable "nodepool_name" {
  type = string
  description = "Nodepool name"
}