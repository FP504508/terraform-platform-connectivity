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

deployment "sandbox" {
  inputs = {
    client_id     = var.client_id
    client_secret = var.client_secret
    tenant_id     = var.tenant_id
  }
}
