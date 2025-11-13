resource "azurerm_network_interface" "NIC" {
    for_each = var.NICname
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_config
    content {
    name                          = ip_configuration.value.name
    subnet_id                     = data.azurerm_subnet.datasubnet.id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}
data "azurerm_subnet" "datasubnet" {
        name = "frontend_subnet"
  virtual_network_name = "NewVnetG3"
  resource_group_name  = "gauravssrisrg3"
}