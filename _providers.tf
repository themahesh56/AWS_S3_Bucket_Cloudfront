/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain provider information.
 * DO NOT include authorization keys
 */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::524687414594:role/TFERole"
  }
}



