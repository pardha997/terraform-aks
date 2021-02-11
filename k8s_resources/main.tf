provider "azurerm" {
    version=">= 2.40.0"
    features{}
}

module "aks_cluster" {
  source = "./modules/aks_cluster"
  resource_group_name = var.resource_group_name
  location = var.location
  agent_count = var.agent_count
  cluster_name = var.cluster_name
  dns_prefix = var.dns_prefix
  agentpool_name = var.agentpool_name
  agentpool_vm_size = var.agentpool_vm_size
}

module "aks_namespace" {
  source = "./modules/aks_namespace"
  ns_name = var.ns_name
  environment = var.environment
  appname = var.appname
}