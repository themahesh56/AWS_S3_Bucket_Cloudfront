
#IAM User Creation
resource "aws_iam_user" "d1flexproduser" {
  count = length(var.username)
  name  = element(var.username, count.index)


  tags = {
    Name = "d1flexproduser"
    BUC  = var.tag_buc

    SupportGroup = var.tag_support_group

    AppGroupEmail = var.tag_app_group_email

    EnvironmentType = var.tag_environment_type

    CustomerCRMID = var.tag_customer_crmid

    SolutionCentralID = var.tag_solution_central_id
  }
}
# IAM user policy attachment 


// resource "aws_iam_user_policy_attachment" "s3_bucket_policy_for_IAM_User"{
//   user=aws_iam_user.d1flexuser.0.name
//   policy_arn=aws_iam_policy.d1flexuser_policy.arn
// }

// # IAM User Policy
// resource "aws_iam_policy" "d1flexuser_policy" {
//   name   = "d1flexuseruat"
//    policy = <<EOF
// {
//   "Version": "2012-10-17",
//       "Statement": [
// {
// "Sid": "AllowServiceUser",
// "Effect": "Allow",
// "Principal": {
// "AWS": "arn:aws:s3:::d1flexbucket"
// },
// "Action": [
// "s3:ListBucket",
// "s3:GetObject",
// "s3:PutObject"
// ]

//     }
//   ]
// }
// EOF
// }

