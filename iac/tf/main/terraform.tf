terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    external = {
      source = "hashicorp/external"
      version = "~> 2.3.4"
    }
  }
}