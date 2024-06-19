# AWS sub account
resource "aws_organizations_account" "production" {
  name      = "production"
  email     = "asteriskengineer@gmail.com"
  parent_id = "r-9lqc"
}

resource "aws_iam_account_alias" "alias" {
  provider      = aws.production
  account_alias = "production"
}


# AWS EC2 instance
# copy from https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  provider = aws.production

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
