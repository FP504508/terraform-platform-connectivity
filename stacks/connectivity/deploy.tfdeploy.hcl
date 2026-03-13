deployment "sandbox" {
  inputs = {
    # Configura subscription_id como variable sensible en HCP Terraform (no hardcodear aquí)
    subscription_id = var.subscription_id
  }
}

variable "subscription_id" {
  type      = string
  sensitive = true
}
