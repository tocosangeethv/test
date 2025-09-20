terraform {
    backend "azurerm" {
    resource_group_name = "rg-st-conn-prd-aiq-aen-001"
    storage_account_name = "stconnprdaiqaen001"
    container_name       = "aiq-state-con"
    key                  = "managed_id/prd/terraform.tfstate"
    }
}