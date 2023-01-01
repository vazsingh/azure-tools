# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "siem-rg" {
  name     = "siem-resources" // azure specific 
  location = "UK South"       // azure specific
  tags = {
    environment = "dev"
  }
}



# Create virtual network
resource "azurerm_virtual_network" "siem-vn" {
  name = "siem-network"
  resource_group_name = azurerm_resource_group.siem-rg.name
  location = azurerm_resource_group.siem-rg.location
  address_space = ["10.123.0.0/16"]

  tags = {
    environment = "dev"
  }
}



