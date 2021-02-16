variable "cluster_role_name" {
    description = "Name of the Cluster Role"
}
variable "cluster_role_binding_name" {
    description = "Name of the Cluster Role Binding"
}
variable "subject" {
  type = object({
    kind       = string
    name           = string
    namespace = string
  })
}