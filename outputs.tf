output "aws_sub_account" {
  value = {
    arn = aws_organizations_account.production.arn
    id  = aws_organizations_account.production.id
  }
}
