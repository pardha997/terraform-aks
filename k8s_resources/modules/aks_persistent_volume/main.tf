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

resource "kubernetes_persistent_volume_claim" "pv_claim" {
  metadata {
    name = var.pv_claim_name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage
      }
    }
    volume_name = "${kubernetes_persistent_volume.pv.metadata.0.name}"
  }
}

resource "kubernetes_persistent_volume" "pv" {
  metadata {
    name = var.pv_name
  }
  spec {
    capacity = {
      storage = var.storage
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      azure_disk {
        data_disk_uri = "/subscriptions/2558261d-2ed7-45ed-8585-f48b58b48cfd/resourcegroups/rg-aks-test/providers/Microsoft.Compute/disks/mysql-pv"
		disk_name = "muysql-pv"
		caching_mode = "Read Write"
      }
    }
  }
}