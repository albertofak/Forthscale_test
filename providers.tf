provider "aws" {
  region  = local.aws_default_region
  profile = "root"

  default_tags {
    tags = local.aws_default_tags
  }
}

provider "aws" {
  region  = local.aws_default_region
  alias   = "production"
  profile = "production"

  assume_role {
    # Switch into the account we created in this module
    # role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/${aws_organizations_account.production.role_name}"
    role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/AWSAFTExecution"
  }
}
