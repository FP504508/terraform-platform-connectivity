variable "hub_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_resource_group" {
  type = string
}

variable "firewall_subnet_name" {
  type = string
}

variable "firewall_public_ip_name" {
  type = string
}

variable "firewall_public_ip_rg" {
  type = string
}

variable "firewall_policy_name" {
  type = string
}

variable "firewall_policy_rg" {
  type = string
}

variable "dns_inbound_subnet_name" {
  type = string
}

variable "dns_outbound_subnet_name" {
  type = string
}

variable "dns_inbound_private_ip" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {
    Application = "Laboratorio"
    Environment = "Sandbox"
    Owner       = "Arquitectura"
  }
}
