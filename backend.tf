terraform {
  required_version = "~> 1.8.5"

  backend "local" {
    path = "terraform.tfstate"
  }
}
