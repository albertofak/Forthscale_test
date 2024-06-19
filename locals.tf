locals {
  aws_default_region = "eu-central-1"

  aws_default_tags = {
    environment = "production"
    terraform   = true
  }
}
