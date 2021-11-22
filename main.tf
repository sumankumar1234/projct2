provider "azurerm" {
  features {}
  subscription_id = "b144169c-d276-4920-a41d-38acbe8315d7"
  client_id       = "ecc6961a-6b98-449e-bcd8-d8180a8e10fd"
  client_secret   = "SuJ7Q~Gt2UjVJNW6dLvK5koOFHjTNt67YlCxW"
  tenant_id       = "cd1851c2-712a-4f00-9d14-d07d79a1b376"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}rg"
  location = var.location
}

