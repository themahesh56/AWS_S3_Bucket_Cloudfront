resource "aws_wafv2_ip_set" "ipset" {
  name               = "akamai-ips1"
  description        = "Akamai IP set"
  scope              = "CLOUDFRONT"
  ip_address_version = "IPV4"
  //addresses        = ["67.220.142.19/32",   "67.220.142.20/32",   "67.220.142.21/32",   "67.220.142.22/32",   "66.198.8.141/32",   "66.198.8.142/32",   "66.198.8.143/32",   "66.198.8.144/32",   "23.48.168.0/22",   "23.50.48.0/20",   "104.71.131.0/24",   "104.97.78.0/24",   "184.26.44.0/24",   "184.27.120.0/24",   "184.27.45.0/24",   "184.28.127.0/24",   "184.51.151.0/24",   "184.51.199.0/24",   "184.84.239.0/24",   "2.16.106.0/24",   "2.18.240.0/24",   "23.10.248.0/24",   "23.205.127.0/24",   "23.211.118.0/24",   "23.216.10.0/24",   "23.219.162.0/24",   "23.219.163.0/24",   "23.219.36.0/24",   "23.34.58.0/24",   "23.34.59.0/24",   "23.43.164.0/24",   "23.45.182.0/24",   "23.53.127.0/24",   "23.63.227.0/24",   "23.67.251.0/24",   "23.79.240.0/24",   "67.129.144.0/25",   "72.246.150.0/24",   "72.246.216.0/24",   "96.7.55.0/24",   "184.28.156.0/24",   "104.77.168.0/24",   "138.122.197.0/24",   "184.28.51.0/24",   "189.36.162.0/24",   "2.16.15.0/24",   "201.16.50.0/24",   "201.33.187.0/25",   "23.48.94.0/24",   "23.54.169.0/24",   "23.67.76.0/24",   "96.6.123.0/24",   "72.246.97.0/24"]
  addresses = local.Akamai_SiteShield_And_SecureEdgeStagingNetwork
  tags = {
    Name              = "d1akamaiips"
    BUC               = var.tag_buc
    SupportGroup      = var.tag_support_group
    AppGroupEmail     = var.tag_app_group_email
    EnvironmentType   = var.tag_environment_type
    CustomerCRMID     = var.tag_customer_crmid
    SolutionCentralID = var.tag_solution_central_id
  }
}

resource "aws_wafv2_web_acl" "waf_acl" {
  name        = "akamai-ips"
  scope       = "CLOUDFRONT"
  description = "Restrict Akamai Ips"

  default_action {
    block {}
  }

  rule {
    name     = "akamaiiplist"
    priority = 0

    action {
      allow {
      }
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.ipset.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "akamaiiplist"
      sampled_requests_enabled   = true
    }
  }

  tags = {
    Name              = "d1akamaiips"
    BUC               = var.tag_buc
    SupportGroup      = var.tag_support_group
    AppGroupEmail     = var.tag_app_group_email
    EnvironmentType   = var.tag_environment_type
    CustomerCRMID     = var.tag_customer_crmid
    SolutionCentralID = var.tag_solution_central_id
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "akamai-ips"
    sampled_requests_enabled   = true
  }
}



