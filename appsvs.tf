

resource "azurerm_app_service_plan" "appsvcpln1" {
  name                = "${var.prefix}apsvcplan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "appsvc1" {
  name                = "${var.prefix}apsvcplan1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.appsvcpln1.id

  site_config {
    dotnet_framework_version = "v5.0"

  }


}
##### Az Containder registry  #####

resource "azurerm_container_registry" "prj2acr1" {
  name                = "Pr2ConRg1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
}
