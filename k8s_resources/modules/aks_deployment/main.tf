terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.0.2"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  features{}
}

resource "kubernetes_deployment" "deploy" {
  metadata {
    name = var.deployment_name
    labels = {
       environment: var.environment
       app: var.app_name      
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
         environment: var.environment
         app: var.appName 
      }
    }

    template {
      metadata {
        labels = {
          environment: var.environment
          app: var.appname 
        }
      }

      spec {
        container {
          image = var.image
          name  = var.container_name

          resources {
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
            requests = {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
          }
          liveness_probe {
            http_get {
              path = var.probe_path
              port = var.probe_port

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = var.initial_delay_seconds
            period_seconds        = var.period_seconds
          }
        }
      }
    }
  }
}