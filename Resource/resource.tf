resource "azurerm_resource_group" "rg-G3" {
  for_each = var.rgnewG3
  name     = each.value.name
  location = each.value.location
}
