variable "deployment_name" {
	description = "Name of the deployment"
}
variable "environment" {
	description = "Environment of the application. eg: dev,qa,prod.."
}
variable "app_name" {
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