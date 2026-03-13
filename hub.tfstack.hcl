required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 4.60"
  }
  random = {
    source  = "hashicorp/random"
    version = "~> 3.0"
  }
}

provider "azurerm" "this" {
  features {}
  subscription_id = var.subscription_id
}

provider "random" "this" {}

variable "subscription_id" {
  type      = string
  sensitive = true
}

locals {
  hubs = {
    mxc = {
      location                = "mexicocentral"
      resource_group          = "rg-connectivity-networkhub-mxc"
      vnet_name               = "vnet-hub-sandbox-mxc-001"
      vnet_resource_group     = "rg-connectivity-networkhub-mxc"
      firewall_subnet_name    = "AzureFirewallSubnet"
      firewall_public_ip_name = "pip-firewall-sandbox-mxc"
      firewall_public_ip_rg   = "rg-connectivity-networkhub-mxc"
      firewall_policy_name    = "demo-pollicy"
      firewall_policy_rg      = "rg-connectivity-networkhub-mxc"
    }
  }
}

component "hub" {
  for_each = local.hubs
  source   = "./components/hub"

  inputs = {
    hub_name       = each.key
    location       = each.value.location
    resource_group = each.value.resource_group

    vnet_name           = each.value.vnet_name
    vnet_resource_group = each.value.vnet_resource_group
    firewall_subnet_name = each.value.firewall_subnet_name

    firewall_public_ip_name = each.value.firewall_public_ip_name
    firewall_public_ip_rg   = each.value.firewall_public_ip_rg

    firewall_policy_name = each.value.firewall_policy_name
    firewall_policy_rg   = each.value.firewall_policy_rg
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
  }
}
