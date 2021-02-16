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

resource "kubernetes_cluster_role_binding" "cluster_role_binding" {
  metadata {
    name = var.cluster_role_binding_name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = var.cluster_role_name
  }

  dynamic "subject" {
    for_each = var.subjects
    content {
      kind = subject.value["kind"]
      name = subject.value["name"]
      subject.value["kind"] != "ServiceAccount" ? api_group : namespace = subject.value["kind"] != "ServiceAccount" ? "rbac.authorization.k8s.io" : subject.value["namespace"]
    }
  }
}