terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {}
  subscription_id = "87b84a94-8529-4c75-8cc4-ea3515c26c39"
  tenant_id       = "1f0e3428-e0ee-443a-97bf-041e37067836"
}