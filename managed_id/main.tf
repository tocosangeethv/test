terraform {
  required_version = ">= 1.0"


  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<=3.116.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = ">=1.0.0"
    }
  }
}


provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azapi" {

}

data "azurerm_client_config" "core" {}

data "azurerm_subscription" "current" {}



module "managed_idenitity" {
  source  = "git::https://gitlab.g42.ae/g42-energy/platform/azure-sre-tools/g42-aiq-azure-iac-terraform-modules.git//modules/managed_identity_1.0.1"
  #source = "../../../../../g42-aiq-azure-iac-terraform-modules/modules_aiq/managed_identity_1.0.1"
  managed_identity    = local.managed_identity
  resource_group_name = local.resource_group_name
  #location            = local.location
  key_vault_name = local.key_vault_name
  key_vault_rg   = local.key_vault_rg
  rbac_role      = local.rbac_role
  required_tags  = local.required_tags
}
#
