# subscription_id="7043807a-0e2b-4e0f-8659-cffba5d627a6"

# tenant_id="5b268d57-2a6f-4e04-b0de-6938583d5ebc"

# client_id="3419418b-950b-4552-85a6-272951d2905f"


## Resource group variables ##
resource_group_name="rg-aks-test"
location="eastus"

## Log analytics variables ##
log_analytics_enable= "true"
solution_name="ContainerInsights"
aks_sku="PerNode"  

## AKS kubernetes cluster variables ##
cluster_name="AKS-BTS-CAAS-jugal-test"
dns_prefix="akstestcluster"

## AKS linux profile variables ##
# admin_username="aksuser"
# ssh_key_data"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCprFfOSw6aA2cCbkcCpoXxEJFVhMkqPbDpc3zdz40+6Qb2713p1b8CxbDa+68HNYwBD3AkX1MxHFeQCe5IobDOlPcoKkBWjEXwDhjNB9oJEjkmOu7VjW7PWOPr8xZRcBeUcIipTQRJ83izk8Tp26IK1Qze0Ji8aA4BzwrrWDHxnXTwu/tuOgR43tG7bSNY52c9/1wS/QgzWOAsycBZDieoIUxE2Id6xtgbSx9UPakGW8g4vOatNpYl4MmlySJNSCHbPxulUpPK0q6Jw4cGfQOUqvQyT/lerpf4Hpe05+7mfH2mlScOf2JLL+tJgMcsAOrSiLHpo7/C9Y2JXFKUDli1P8TqWA+w4FoLzdoRFM70RRlQWCZ2OyjPtPvlq6TA8bm9hvnZvZSV9X4bvXffdorc+jmQDh9xB32qaoTtba+HX4LoNR7bc3W+BmIEQd+JCHXBBU9wmqXpav/x9AR7oHA/g+xl2v8IgGEwUJXfUVCpcs5GPIrU4kryZ6BInvyIaKiw7Uth/7go9aVZ55jRSt/WwRNRMhK2PkOI2qguKWIHyV7xKM8kD3U2Xz/x8800UVHPnsO0AuhfOuoo9Dwn2ZD+C8HOqpEOTVebQ/F1qKdqzusE6uRwB8IhOmviW72wRzYw/nBCvRiR2iivuB0QAff4T0za0kY7xcVOFM4MQgsVuQ== jugal_krishna@cc-fb226c8f-6cd456f65d-v6fg8"

## AKS agent pool variables ##
agentpool_name="agentpool"

agent_count= "1"

agentpool_vm_size="Standard_D2s_v3"

# agentpool_vm_os_type="Linux"

# AKS Subnet ID

#subnet_id="/subscriptions/7043807a-0e2b-4e0f-8659-cffba5d627a6/resourceGroups/RG-CoreServiceDev-Default/providers/Microsoft.Network/virtualNetworks/VNET-ABT-10.232.67.0-24/subnets/SN-ABT_10.232.67.0-25"

#for namespace
ns_name = "aks-test-namespace"
appname = "test-aks-appname"
environment = "dev-env"


