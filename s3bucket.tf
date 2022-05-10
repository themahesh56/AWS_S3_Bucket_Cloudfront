resource "aws_s3_bucket" "d1flexprodbuck" {
  bucket = "d1flexprodbucket"
  acl    = "private"
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name              = "d1cloudfrontdistribution"
    BUC               = var.tag_buc
    SupportGroup      = var.tag_support_group
    AppGroupEmail     = var.tag_app_group_email
    EnvironmentType   = var.tag_environment_type
    CustomerCRMID     = var.tag_customer_crmid
    SolutionCentralID = var.tag_solution_central_id
    ExpirationDate    = var.tag_expiration_date
    SLA               = var.tag_sla
    NPI               = var.tag_npi
  }

}
resource "aws_s3_bucket_policy" "d1flexprodbucket" {
  bucket = aws_s3_bucket.d1flexprodbuck.id

  policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "DenyUnsecuredTransport",
"Effect": "Deny",
"Principal": {
"AWS": "*"
},
"Action": "s3:*",
"Resource": [
"arn:aws:s3:::d1flexprodbucket/*",
"arn:aws:s3:::d1flexprodbucket"
],
"Condition": {
"Bool": {
"aws:SecureTransport": "false"
}
}
},
{
"Sid": "AllowCloudFront",
"Effect": "Allow",
"Principal": {
"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3CB6354LDRRB"
},
"Action": [
"s3:ListBucket",
"s3:GetObject",
"s3:PutObject"
],
"Resource": [
"arn:aws:s3:::d1flexprodbucket/*",
"arn:aws:s3:::d1flexprodbucket"
]
},
{
"Sid": "AllowServiceUser",
"Effect": "Allow",
"Principal": {
"AWS": "arn:aws:iam::524687414594:user/srv_d1flex_sts_uat"
},
"Action": [
"s3:ListBucket",
"s3:GetObject",
"s3:PutObject"
],
"Resource": [
"arn:aws:s3:::d1flexprodbucket/*",
"arn:aws:s3:::d1flexprodbucket"
]
},
{
"Sid": "4",
"Effect": "Allow",
"Principal": {
"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3CB6354LDRRB"
},
"Action": "s3:GetObject",
"Resource": "arn:aws:s3:::d1flexprodbucket/*"
}
]
}

POLICY

}















  