resource "azurerm_storage_account" "strgnewhai" {
  for_each                 = var.storage_name
  name                     = each.key
  resource_group_name      = each.value.name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
