data "azurerm_virtual_network" "hub" {

  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group

}

data "azurerm_public_ip" "firewall" {

  name                = var.firewall_public_ip_name
  resource_group_name = var.firewall_public_ip_rg

}

data "azurerm_subnet" "firewall" {

  name                 = var.firewall_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group

}

data "azurerm_firewall_policy" "existing" {

  name                = var.firewall_policy_name
  resource_group_name = var.firewall_policy_rg

}

data "azurerm_subnet" "dns_inbound" {
  name                 = var.dns_inbound_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group
}

data "azurerm_subnet" "dns_outbound" {
  name                 = var.dns_outbound_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group
}


