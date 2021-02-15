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

resource "kubernetes_service" "service" {
  metadata {
    name = "var.service_name"
  }
  spec {
    selector = {
       environment: var.environment
       app: var.app_name      
    }
    session_affinity = "ClientIP"
    port {
      port        = var.port
      target_port = var.target_port
    }

    type = var.service_type
  }
}