terraform {
  backend "s3" {
    bucket       = "bastion-terraform-test-s3"
    key          = "terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
    encrypt = true
  }
}
