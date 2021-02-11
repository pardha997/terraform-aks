provider "azurerm" {
    version=">= 2.40.0"
    # SET ARM_CLIENT_ID="e6f8a4ab-c5a4-4177-adc0-f5c8814a1dc4"
    # SET ARM_TENANT_ID="b154d82e-b08a-410b-847c-0c601164b4ad"
    # SET ARM_SUBSCRIPTION_ID="2558261d-2ed7-45ed-8585-f48b58b48cfd"
    # SET ARM_CLIENT_SECRET="5_1VG.EmMx.89_9IrWkYIY.0xt...u76ul"
    features{}
}

resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.location  
}

data "azurerm_key_vault" "aks_key_vault" {
  name                = "AKS-CRED-VAULT"
  resource_group_name = "rg-aks-test"
}
data "azurerm_key_vault_secret" "aks_key_vault_secret" {
  name         = "SpSecret"
  key_vault_id = data.azurerm_key_vault.aks_key_vault.id
}

resource "azurerm_kubernetes_cluster" "aksa" {
  name       = var.cluster_name
  location   = var.location
  dns_prefix = var.dns_prefix
  resource_group_name = azurerm_resource_group.rgroup.name
  private_cluster_enabled = false
  
  role_based_access_control {
    enabled = "true"
  }

  default_node_pool {
        name            = var.agentpool_name
        type            = "AvailabilitySet"
        node_count      = var.agent_count
        vm_size         = var.agentpool_vm_size
        #vnet_subnet_id  = var.subnet_id

  }
  service_principal {
     client_id     = "e6f8a4ab-c5a4-4177-adc0-f5c8814a1dc4"
     client_secret = data.azurerm_key_vault_secret.aks_key_vault_secret.value
   }

  network_profile {
    network_plugin = "azure"
    # network_policy = "calico"
    load_balancer_sku  = "basic"
  }
  
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)"
  }
}

