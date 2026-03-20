resource "azurerm_private_dns_resolver" "this" {
  name                = "dnspresolver-sandbox-${var.hub_name}"
  resource_group_name = var.resource_group
  location            = var.location
  virtual_network_id  = data.azurerm_virtual_network.hub.id

  tags = var.tags
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "this" {
  name                    = "dnsendpoint-hub-inbound-sandbox-${var.hub_name}"
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = var.location

  ip_configurations {
    private_ip_allocation_method = "Static"
    private_ip_address           = var.dns_inbound_private_ip
    subnet_id                    = data.azurerm_subnet.dns_inbound.id
  }

  tags = var.tags
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this" {
  name                    = "dnsendpoint-hub-outbound-sandbox-${var.hub_name}"
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  location                = var.location
  subnet_id               = data.azurerm_subnet.dns_outbound.id

  tags = var.tags
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "this" {
  name                                       = "dnsfrs-hub-sandbox-${var.hub_name}"
  resource_group_name                        = var.resource_group
  location                                   = var.location
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.this.id]

  tags = var.tags
}

resource "azurerm_private_dns_resolver_virtual_network_link" "hub" {
  name                      = "vnet-hub-sandbox-${var.hub_name}-001-link"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.this.id
  virtual_network_id        = data.azurerm_virtual_network.hub.id
}
