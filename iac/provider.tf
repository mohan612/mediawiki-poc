terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "mr-task-01"
      storage_account_name = "mrtaskstg01"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
    features {}
    }


