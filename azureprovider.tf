terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  features {}
  alias = "AKLAB-Master"
  subscription_id = "66cde824-bb4f-441d-b872-644589bd2cf4"
}

provider "azurerm" {
  features {}
  alias = "AKLAB-CoreInfra"
  subscription_id = "c5c34a81-a1b4-477e-a187-893a507dce34"
}

provider "azurerm" {
  features {}
  alias = "AKLAB-MicroServicesInfra"
  subscription_id = "944b31f7-f993-4d82-a8c0-bdf906970613"
}