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
 
resource "kubernetes_secret" "mysql" {
  metadata {
    name = "mysql-pass"
  }
 
  data = {
    password = var.mysql_password
  }
}
 
resource "kubernetes_deployment" "mysql" {
  metadata {
    name = var.deployment_name_sql
    labels = {
       environment = var.environment
       app = var.app_name_sql     
    }
  }
 
  spec {
    replicas = var.replicas
 
    selector {
      match_labels = {
         environment = var.environment
         app = var.app_name_sql
      }
    }
 
    template {
      metadata {
        labels = {
          environment = var.environment
          app = var.app_name_sql
        }
      }
 
      spec {
        container {
            image = "mysql:5.6"
            name  = "mysql"

 

            env {
              name = "MYSQL_ROOT_PASSWORD"
              value_from {
                secret_key_ref {
                  name = kubernetes_secret.mysql.metadata[0].name
                  key  = "password"
                }
              }
            }

 

            port {
              container_port = 3306
              name           = "mysql"
            }

 

            volume_mount {
              name       = "mysql-persistent-storage"
              mount_path = "/var/lib/mysql"
            }
        }

 

        volume {
            name = "mysql-persistent-storage"
            persistent_volume_claim {
              claim_name = var.pv_claim_name
            }
        }
      }
    }
  }
}