## Definiendo providers.tf

En este primer paso, definimos que proveedores vamos a necesitar.
Los providers contienen la configuración, recursos y datos necesarios para comunicarse con Azure (AWS, GCP..)
En este ejemplo usaremos dos: 
  -azurerm (Azure Resource Manager) que usaremos para la creación de los grupos de recursos 
  -azuread (Azure Active Directory) que utilizaremos para la creación de los usuarios y la asignación de roles.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"         # Donde encontrar el provider azurerm dentro de registry.terraform
      version = "~> 4.26.0"                 # Defino una versión de hace 2 meses para evitar confictos con versiones beta
    }
    azuread = {
      source  = "hashicorp/azuread"         # Donde encontrar el provider azuread dentro de registry.terraform
      version = "~> 3.2.0"                  # Defino una versión de hace 2 meses para evitar confictos con versiones beta
    }
  }
}

provider "azurerm" {                        #¿Que necesita el provider azurerm para poder crear/modificar/eliminar recursos?
  features {}

  subscription_id = var.subscription_id     #El ID de la suscripción será una variable asociada al archivo secrets.tfvars que se explicará después
  tenant_id       = var.tenant_id           #El ID del tenant será una variable asociada al archivo secrets.tfvars que se explicará después
}

provider "azuread" {                        #¿Que necesita el provider azuread para poder crear/modificar/eliminar usuarios?
  tenant_id     = var.tenant_id             #El ID del tenant será una variable asociada al archivo secrets.tfvars que se explicará después
}
