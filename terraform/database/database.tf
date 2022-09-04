##Functional example the students will deploy themselves

resource "azurerm_resource_group" "db" {
  name     = random_pet.dbserver.id
  location = "westeurope"
}


resource "azurerm_mssql_server" "mssql_server" {
  name                         = "${azurerm_resource_group.db.name}-sqlserver"
  resource_group_name          = azurerm_resource_group.db.name
  location                     = azurerm_resource_group.db.location
  version                      = "12.0"
  administrator_login          = "dbadmin"
  administrator_login_password = random_password.password.result
}

resource "azurerm_mssql_database" "database" {
  name           = "${azurerm_resource_group.db.name}-db"
  server_id      = azurerm_mssql_server.mssql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  min_capacity = 0.5
  max_size_gb = 32
  auto_pause_delay_in_minutes = 60
  sku_name       = "GP_S_Gen5_2"

  tags = {
    group = "${azurerm_resource_group.db.name}"
    environment = "test"
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!"
}

resource "azurerm_key_vault_secret" "db_password" {
 name = "dbadmin"
 key_vault_id = azurerm_key_vault.kv.id
 value = random_password.password.result 
}

resource "random_pet" "dbserver" {
  length = 2
}