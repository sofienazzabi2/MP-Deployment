provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.1" # Ensure compatibility with your Terraform version
    }
  }
}
