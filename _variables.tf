/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain input variables.
 */
variable "username" {
  type    = list(string)
  default = ["srv_d1flex_sts_prod"]
}
variable "tag_buc" {
  default = "3002.501000.9381..0000.0000.1133"
}

variable "tag_support_group" {
  default = "D1Flex ApplicationDelivery"
}

variable "tag_app_group_email" {
  default = "D1Flex.ServiceDelivery@fisglobal.com"
}

variable "tag_environment_type" {
  default = "Production"
}

variable "tag_customer_crmid" {
  default = "FIS 6015"
}

variable "tag_expiration_date" {
  default = "Never"
}

variable "tag_sla" {
  default = "99.99"
}

variable "tag_solution_central_id" {
  default = "17040"
}

variable "tag_npi" {
  default = "False"
}

variable "region" {
  default = "us-east-1"
}

variable "domainJoin_user" {
  description = "User name of the domain account"
  default     = "SVC-TF-Machine-Join"
}

variable "domainJoin_pass" {
  description = "**TFE VAR**: Password of the domain account"
}

