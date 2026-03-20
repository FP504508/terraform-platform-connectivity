module "hub_network" {

  source = "../../modules/hub_network"

  hub_name       = var.hub_name
  location       = var.location
  resource_group = var.resource_group

  vnet_name           = var.vnet_name
  vnet_resource_group = var.vnet_resource_group

  firewall_subnet_name = var.firewall_subnet_name

  firewall_public_ip_name = var.firewall_public_ip_name
  firewall_public_ip_rg   = var.firewall_public_ip_rg

  firewall_policy_name = var.firewall_policy_name
  firewall_policy_rg   = var.firewall_policy_rg

  dns_inbound_subnet_name  = var.dns_inbound_subnet_name
  dns_outbound_subnet_name = var.dns_outbound_subnet_name
  dns_inbound_private_ip   = var.dns_inbound_private_ip

  tags = var.tags
}
