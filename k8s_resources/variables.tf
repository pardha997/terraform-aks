

## Resource group variables ##
variable "resource_group_name" {
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
  type = "string"
  default = "RG-BTS-sha-2"
}

variable "location" {
  description = "The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
  type = "string"
  default = "eastus"
}


## Log analytics variables ##
variable "log_analytics_enable"{
    description = "Is the OMS Agent Enabled?"
    default = "true"
}

variable "solution_name" {
  description = "Specifies the name of the solution to be deployed. Changing this forces a new resource to be created."  
  default = "ContainerInsights"
}
variable "aks_sku" {
  description = "Specifies the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, and PerGB2018 (new Sku as of 2018-04-03)."
  default = "PerNode"  
}
## AKS kubernetes cluster variables ##
variable "cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  default = "aks-flask-demo"
}
variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster."
  default = "flask"
}

## AKS agent pool variables ##

variable "agent_count" {
  description = "Number of Agents (VMs) in the Pool. Possible values must be in the range of 1 to 100 (inclusive). Defaults to 1."
  default = "1"
}

variable "agentpool_vm_size" {}
variable "agentpool_name" {}

# AKS Subnet ID

variable "subnet_id" {
    
    description = "The subnet id of AKS."
    default = "/subscriptions/7043807a-0e2b-4e0f-8659-cffba5d627a6/resourceGroups/RG-CoreServiceDev-Default/providers/Microsoft.Network/virtualNetworks/VNET-ABT-10.232.67.0-24/subnets/SN-ABT_10.232.67.0-25"
}

#namespace variables
variable "ns_name" {
    description = "Name of the Namespace"
}
variable "environment" {
    description = "Environment of the application. eg: dev,qa,prod.."
}
variable "appname" {
    description = "Name of the application"
}
