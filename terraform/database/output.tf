output "resource_group_name" {
  value = azurerm_resource_group.db.name
}

output "sql_server_connection_address" {
  value = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}

output "sql_server_admin_password" {
  value = azurerm_mssql_server.mssql_server.administrator_login_password
  sensitive = true
}

