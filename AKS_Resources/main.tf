provider "azurerm" {
    version=">= 2.40.0"
    features{}
}

#for k8s namespace
module "aks_namespace" {
 source = "./modules/aks_namespace"
 ns_name = var.ns_name
 environment = var.environment
 appname = var.appname
}

#for front end deployment
module "aks_deployment" {
 source = "./modules/aks_deployment"
 deployment_name = var.deployment_name
 environment = var.environment
 app_name_dep = var.app_name_dep
 replicas = var.replicas
 image = var.image
 container_name = var.container_name
 cpu_limit = var.cpu_limit
 memory_limit = var.memory_limit
 cpu_request = var.cpu_request
 memory_request = var.memory_request
 probe_path = var.probe_path
 probe_port = var.probe_port
 initial_delay_seconds = var.initial_delay_seconds
 period_seconds = var.period_seconds
}

#for front end LB service
module "aks_service" {
 source = "./modules/aks_service"
 service_name = var.service_name
 port = var.port
 target_port = var.target_port
 service_type = var.service_type
 environment = var.environment
 app_name_dep = var.app_name_dep
}

#for persistent volume
module "aks_persistent_volume" {
 source = "./modules/aks_persistent_volume"
 pv_claim_name = var.pv_claim_name
 storage = var.storage
 pvc_storage = var.pvc_storage
 pv_name = var.pv_name
}

#for sql service
module "aks_service_sql" {
 source = "./modules/aks_service"
 service_name = var.sql_service_name
 port = var.sql_port
 target_port = var.sql_target_port
 service_type = var.sql_service_type
 environment = var.environment
 app_name_dep = var.app_name_sql
}

#for sql deployment
module "aks_deployment_mysql" {
 source = "./modules/aks_deployment_mysql"
 pv_claim_name = var.pv_claim_name
 app_name_sql = var.app_name_sql
 replicas = var.replicas
 environment = var.environment
 mysql_password = var.mysql_password
 deployment_name_sql = var.deployment_name_sql
}