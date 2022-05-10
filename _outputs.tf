/**
 * File provided as part of base bitbucket scaffolding
 * this file should contain output variables.
 */

output "user_arn" {
  value = aws_iam_user.d1flexproduser.0.arn
}