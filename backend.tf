terraform {
  backend "azurerm" {
    resource_group_name  = "OCEAN"
    storage_account_name = "interstelar"
    container_name       = "terraformcont"
    key                  = "aks/terraform.tfstate"
  }
}