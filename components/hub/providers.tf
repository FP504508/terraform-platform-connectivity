# Los providers son inyectados por el stack (hub.tfstack.hcl)
# No se configuran aquí para compatibilidad con HCP Terraform Stacks

provider "azurerm" {
  features {}
  subscription_id = "39059978-6c79-4df2-bb26-ee93afc78d8a"
}
