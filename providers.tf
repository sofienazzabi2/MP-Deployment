provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.1"  # Ensure compatibility with your Terraform version
    }
  }
}

# Optional: If you're still encountering issues with provider registration,
# you can explicitly skip provider registration, but this is not typically necessary for AKS.
# provider "azurerm" {
#   features {}
#   skip_provider_registration = true
# }
