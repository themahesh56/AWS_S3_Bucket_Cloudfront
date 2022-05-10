/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain TFE Backend configuration.
 * DO NOT include authorization keys
 */

terraform {
  required_version = "1.0.9"

  backend "remote" {
    hostname     = "vlmaztform01.fisdev.local"
    organization = "FIS-Cloud-Services"

    workspaces {
      name = "production-digital-one-flex-fis-internal-prod"
    }
  }
}

/*** Vault Auth ***/

// Azure
/* data "vault_azure_access_credentials" "azure_creds" {
  backend                     = var.vault_backend
  role                        = var.vault_role
  validate_creds              = true
  num_sequential_successes    = 3
  num_seconds_between_tests   = 2
  max_cred_validation_seconds = 1200
}

variable "vault_backend" {}

variable "vault_role" {} */

// AWS
