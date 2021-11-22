

resource "azurerm_mssql_server" "prj2sqlsrvr" {
  name                         = "${var.prefix}sqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "vmadmin"
  administrator_login_password = "Ahlstrom@123"
}

resource "azurerm_mssql_database" "Prj2DB1" {
  name           = "AZDB1"
  server_id      = azurerm_mssql_server.prj2sqlsrvr.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  read_scale     = false
  sku_name       = "Basic"
  zone_redundant = false
}
