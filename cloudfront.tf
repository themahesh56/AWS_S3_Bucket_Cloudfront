
###################################
# CloudFront Origin Access Identity
###################################
resource "aws_cloudfront_origin_access_identity" "d1flexiden" {
  comment = "d1flexiden"
}

###################################
# CloudFront
###################################
resource "aws_cloudfront_distribution" "d1prodcloudfrontdistribution" {
  enabled = true
  #default_root_object = "index.html"
  is_ipv6_enabled = true
  web_acl_id      = aws_wafv2_web_acl.waf_acl.arn

  default_cache_behavior {
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
    "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-d1flexprodbucket"
    viewer_protocol_policy = "allow-all"
    compress               = false

    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0
    forwarded_values {
      query_string = false
      cookies {
        forward           = "none"
        whitelisted_names = []
      }
    }

  }


  origin {
    domain_name = "d1flexprodbucket.s3.us-east-1.amazonaws.com"
    origin_id   = "S3-d1flexprodbucket"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E3CB6354LDRRB"
    }
    /*
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      #origin_ssl_protocols   = "TLSv1.2"

      origin_ssl_protocols = [
        "TLSv1",
        "TLSv1.1",
        "TLSv1.2",
      ]

    } 
    */
  }




  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {

    Name = "d1prodcloudfrontdistribution"

    BUC = var.tag_buc

    SupportGroup = var.tag_support_group

    AppGroupEmail = var.tag_app_group_email

    EnvironmentType = var.tag_environment_type

    CustomerCRMID = var.tag_customer_crmid

    SolutionCentralID = var.tag_solution_central_id
  }


}
