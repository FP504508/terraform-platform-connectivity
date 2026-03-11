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


