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
  
}

resource "kubernetes_namespace" "ns" {
  metadata {
    annotations = {}

    labels = {
       environment: var.environment
       app: var.appname
    }

    name = var.ns_name
  }
}