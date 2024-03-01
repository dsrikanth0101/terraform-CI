terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "dsrikanth0101"

    workspaces {
      name = "Terraform-CI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "azure-labs-practice-test-CI"
  location = "South India"
}

resource "azurerm_storage_account" "sa" {
  name = "testsa8967586kvd"
  resouresource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"  
}

