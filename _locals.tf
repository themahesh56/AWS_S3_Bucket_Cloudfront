/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain output variables.
 */

locals {
  Akamai_SiteShield_And_SecureEdgeStagingNetwork = data.terraform_remote_state.production_gateway_primary_azure.outputs.Akamai_SiteShield_And_SecureEdgeStagingNetwork

}
