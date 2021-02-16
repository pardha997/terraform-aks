

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
  default = "aks-cluster-test-new"
}
variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster."
  default = "aksclusterdns"
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

variable "deployment_name" {
	description = "Name of the deployment"
}

variable "app_name_dep" {
	description = "Name of the application"
}
variable "replicas" {
	description = "Count of the pods"
}
variable "image" {
	description = "Image to be used for the container"
}
variable "container_name" {
	description = "Name of the Container"
}
variable "cpu_limit" {
	description = "Maximum CPU limit that can be utilized by pod"
}
variable "memory_limit" {
	description = "Maximum Memory limit that can be utilized by pod"
}
variable "cpu_request" {
	description = "Minimum guaranteed CPU assigned to pod"
}
variable "memory_request" {
	description = "Minimum guaranteed Memory assigned to pod"
}
variable "probe_path" {
	description = "Probe path for health check"
}
variable "probe_port" {
	description = "Probe port for health check"
}
variable "initial_delay_seconds" {
	description = "Number of seconds after the container has started before liveness or readiness probes are initiated. Defaults to 0 seconds. Minimum value is 0."
}
variable "period_seconds" {
	description = "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1"
}

variable "service_name" {
    description = "Name of the Service"
}
variable "port" {
    description = "The port that will be exposed by this service."
}
variable "target_port" {
    description = "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535."
}
variable "service_type" {
    description = "Determines how the service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer"
}

variable "pv_claim_name" {
    description = ""
}
variable "storage" {
    description = ""
}
variable "pv_name" {
    description = ""
}
variable "pvc_storage" {
    description = ""
}

#sql deployment
variable "mysql_password" {
	description = "Image to be used for the container"
}
variable "deployment_name_sql" {
	description = "Image to be used for the container"
}
variable "app_name_sql" {
	description = "Image to be used for the container"
}

variable "sql_port" {
    description = "The port that will be exposed by this service."
}
variable "sql_target_port" {
    description = "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535."
}
variable "sql_service_type" {
    description = "Determines how the service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer"
}
variable "sql_service_name" {
    description = "Determines how the service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer"
}


