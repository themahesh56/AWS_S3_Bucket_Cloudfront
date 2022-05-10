/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain output variables.
 */

 data "terraform_remote_state" "production_gateway_primary_aws" {
  backend = "remote"

  config = {
    hostname     = "vlmaztform01.fisdev.local"
    organization = "FIS-Cloud-Services"
    workspaces = {
      name = "production-gateway-primary-aws"
    }
  }
}


data "terraform_remote_state" "production_gateway_primary_azure" {
  backend = "remote"

  config = {
    hostname     = "vlmaztform01.fisdev.local"
    organization = "FIS-Cloud-Services"
    workspaces = {
      name = "production-gateway-primary-azure"
    }
  }
}
