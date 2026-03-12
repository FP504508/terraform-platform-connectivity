

resource "azurerm_firewall" "hub_fw" {

  name                = "afirewall-sandboxPIRF-${var.hub_name}"
  location            = var.location
  resource_group_name = var.resource_group

  sku_name = "AZFW_VNet"
  sku_tier = "Premium"

  firewall_policy_id = data.azurerm_firewall_policy.existing.id


  ip_configuration {
    name                 = "fw-ipconfig"
    subnet_id            = data.azurerm_subnet.firewall.id
    public_ip_address_id = data.azurerm_public_ip.firewall.id

  }
}
