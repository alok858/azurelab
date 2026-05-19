#Terraform settings block:
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.47.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

# Terraform provider block:
provider "azurerm" {
  features {}
  alias = "AKLAB-Master"
  subscription_id = var.aklab_master_subscription_id
}

provider "azurerm" {
  features {}
  alias = "AKLAB-CoreInfra"
  subscription_id = var.aklab_coreinfra_subscription_id
}

provider "azurerm" {
  features {}
  alias = "AKLAB-MicroServicesInfra"
  subscription_id = var.aklab_microservicesinfra_subscription_id
}

provider "azuread" {
  //version = "2.47.0"
  tenant_id = var.azuread_tenant_id
}
