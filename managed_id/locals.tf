module "common" {
  source = "../common_values"
}

locals {
  ##### Commmon Parameters for all the Managed IDs  #################

  resource_group_name = "rg-sec-conn-prd-aiq-aen-001"
  key_vault_name      = "kvconnprdaiqaen001"
  key_vault_rg        = "rg-sec-conn-prd-aiq-aen-001"
  rbac_role           = "Key Vault Crypto Service Encryption User"

  ####################################### Specic Parmeters for each managed ID ####################
  ######### Below Optional parmeters can be used to customize any settings for the managed ID #####
  ################ Values Given here a for example ##########
  # desired_name =  "my-managed-id"    # This is for assining a non stand ard name 
  #resource_group_name = "SBI-POC-predeploymenttest-Backupup-rg"  
  #roles       =  [ "Key Vault Crypto Service Encryption User" , "Network Contributor"]
  #location     = "East US" 

  managed_identity = {
    mi1 = merge(module.common.common_attributes , {
          application = "des"
          instance    = "001"
          additional_tags = {
              "ApplicationName" = "Managed ID for Disk"
          }
      })
    mi2 = merge(module.common.common_attributes, {
          application = "st"
          instance    = "001"
          additional_tags = {
              "ApplicationName" = "Managed ID for Storage"
          }
      })
    mi3 = merge(module.common.common_attributes, {
          application = "bvault"
          instance    = "001"
          additional_tags = {
              "ApplicationName" = "Managed ID for BackupVault"
          }
      })
    mi4 = merge(module.common.common_attributes, {
          application = "rsv"
          instance    = "001"
          additional_tags = {
              "ApplicationName" = "Managed ID for Recovery Services Vault"
          }
      })
  }

  required_tags = merge(module.common.common_tags,
      {
        "ApplicationName" = "Managed Identity"
      }
    )
}


