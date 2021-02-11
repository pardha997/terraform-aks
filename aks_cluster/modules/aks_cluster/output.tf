output "subnet_id" {
  value = "azurerm_kubernetes_cluster.aksa.agent_pool_profile.0.vnet_subnet_id"
}

output "network_plugin" {
  value ="azurerm_kubernetes_cluster.aksa.network_profile.0.network_plugin"
}

output "service_cidr" {
  value = "azurerm_kubernetes_cluster.aksa.network_profile.0.service_cidr"
}

output "dns_service_ip" {
  value = "azurerm_kubernetes_cluster.aksa.network_profile.0.dns_service_ip"
}

output "docker_bridge_cidr" {
  value = "azurerm_kubernetes_cluster.aksa.network_profile.0.docker_bridge_cidr"
}

output "pod_cidr" {
  value = "azurerm_kubernetes_cluster.aksa.network_profile.0.pod_cidr"
}
output "aks_clustername" {
  value = "azurerm_kubernetes_cluster.aksa.name"
}
output "aks_clusterID" {
  value = "azurerm_kubernetes_cluster.aksa.id"
}
output "resource_group_name" {
  value = "azurerm_resource_group.rgroup.name"
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.aksa.kube_config_raw
}