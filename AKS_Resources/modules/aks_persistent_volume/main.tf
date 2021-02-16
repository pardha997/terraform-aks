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

resource "kubernetes_persistent_volume" "pv" {
  metadata {
    name = var.pv_name
  }
  spec {
    capacity = {
      storage = var.storage
    }
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "standard"
    persistent_volume_source {
      azure_disk {
        data_disk_uri = "/subscriptions/2558261d-2ed7-45ed-8585-f48b58b48cfd/resourcegroups/RG-Persistent-Disk/providers/Microsoft.Compute/disks/mysql-pv"
		    disk_name = "mysql-pv"
		    caching_mode = "ReadWrite"
        kind          = "Managed"
      }
    }
  }
}


resource "kubernetes_persistent_volume_claim" "pv_claim" {
  metadata {
    name = var.pv_claim_name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.pvc_storage
      }
    }
    volume_name = kubernetes_persistent_volume.pv.metadata.0.name
    storage_class_name = "standard"
  }
}

