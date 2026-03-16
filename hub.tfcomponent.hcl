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

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

provider "azurerm" "this" {
  config {
    features {}
    subscription_id = "39059978-6c79-4df2-bb26-ee93afc78d8a"
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
  }
}

provider "random" "this" {}

component "hub_mxc" {
  source = "./components/hub"

  inputs = {
    hub_name       = "mxc"
    location       = "mexicocentral"
    resource_group = "rg-connectivity-networkhub-mxc"

    vnet_name            = "vnet-hub-sandbox-mxc-001"
    vnet_resource_group  = "rg-connectivity-networkhub-mxc"
    firewall_subnet_name = "AzureFirewallSubnet"

    firewall_public_ip_name = "pip-firewall-sandbox-mxc"
    firewall_public_ip_rg   = "rg-connectivity-networkhub-mxc"

    firewall_policy_name = "demo-pollicy"
    firewall_policy_rg   = "rg-connectivity-networkhub-mxc"
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
  }
}
