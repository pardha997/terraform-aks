variable "service_name" {
    description = "Name of the Service"
}
variable "environment" {
    description = "Environment of the application. eg: dev,qa,prod.."
}
variable "app_name_dep" {
    description = "Name of the application"
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