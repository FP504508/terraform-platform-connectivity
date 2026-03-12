stack {
  name = "platform-connectivity"
}

locals {

  hubs = {

    mxc = {
      location = "mexicocentral"
      resource_group = "rg-connectivity-networkhub-mxc"

      vnet_name = "vnet-hub-sandbox-mxc-001"
      vnet_resource_group = "rg-connectivity-networkhub-mxc"

      firewall_subnet_name = "AzureFirewallSubnet"

      firewall_public_ip_name = "pip-firewall-sandbox-mxc"
      firewall_public_ip_rg   = "rg-connectivity-networkhub-mxc"

      firewall_policy_name = "demo-pollicy"
      firewall_policy_rg   = "rg-connectivity-networkhub-mxc"
    }



  }

}


deployment "connectivity" {
component "hub" {

  for_each = local.hubs

  source = "./components/hub"

  inputs = {

    subscription_id = "39059978-6c79-4df2-bb26-ee93afc78d8a"

    hub_name = each.key
    location = each.value.location

    resource_group = each.value.resource_group

    vnet_name = each.value.vnet_name
    firewall_subnet_name = each.value.firewall_subnet_name

  }
}
}

esto_es_un_error