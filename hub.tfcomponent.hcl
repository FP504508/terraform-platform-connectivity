required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.60"
  }
}

provider "azurerm" "this" {
  config {
    features {}
    subscription_id = "39059978-6c79-4df2-bb26-ee93afc78d8a"
  }
}

locals {
  hubs = {
    mxc = {
      location                 = "mexicocentral"
      resource_group           = "rg-connectivity-networkhub-mxc"
      vnet_name                = "vnet-hub-sandbox-mxc-001"
      vnet_resource_group      = "rg-connectivity-networkhub-mxc"
      firewall_subnet_name     = "AzureFirewallSubnet"
      firewall_public_ip_name  = "pip-firewall-sandbox-mxc"
      firewall_public_ip_rg    = "rg-connectivity-networkhub-mxc"
      firewall_policy_name     = "demo-pollicy"
      firewall_policy_rg       = "rg-connectivity-networkhub-mxc"
      dns_inbound_subnet_name  = "snet-dnsr-inbound-mxc-002"
      dns_outbound_subnet_name = "snet-dnsr-outbound-mxc-003"
      dns_inbound_private_ip   = "10.82.0.68"
      tags = {
        Application = "Laboratorio"
        Environment = "Sandbox"
        Owner       = "Arquitectura"
      }
    }
    eus = {
      location                 = "eastus"
      resource_group           = "rg-connectivity-networkhub-eus"
      vnet_name                = "vnet-hub-sandbox-eus-001"
      vnet_resource_group      = "rg-connectivity-networkhub-eus"
      firewall_subnet_name     = "AzureFirewallSubnet"
      firewall_public_ip_name  = "pip-afirewall-sandbox-eus"
      firewall_public_ip_rg    = "rg-connectivity-networkhub-eus"
      firewall_policy_name     = "fwpolicy-connectivity-sandbox-eus"
      firewall_policy_rg       = "rg-connectivity-networkhub-eus"
      dns_inbound_subnet_name  = "snet-dnsr-inbound-eus-002"
      dns_outbound_subnet_name = "snet-dnsr-outbound-eus-003"
      dns_inbound_private_ip   = "10.82.128.68"
      tags = {
        Application = "Laboratorio"
        Environment = "Sandbox"
        Owner       = "Arquitectura"
      }
    }
  }
}

component "hub" {
  for_each = local.hubs
  source   = "./components/hub"

  inputs = {
    hub_name                 = each.key
    location                 = each.value.location
    resource_group           = each.value.resource_group
    vnet_name                = each.value.vnet_name
    vnet_resource_group      = each.value.vnet_resource_group
    firewall_subnet_name     = each.value.firewall_subnet_name
    firewall_public_ip_name  = each.value.firewall_public_ip_name
    firewall_public_ip_rg    = each.value.firewall_public_ip_rg
    firewall_policy_name     = each.value.firewall_policy_name
    firewall_policy_rg       = each.value.firewall_policy_rg
    dns_inbound_subnet_name  = each.value.dns_inbound_subnet_name
    dns_outbound_subnet_name = each.value.dns_outbound_subnet_name
    dns_inbound_private_ip   = each.value.dns_inbound_private_ip
    tags                     = each.value.tags
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}
