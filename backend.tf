terraform {
  backend "s3" {
    bucket = "bastion-terraform-test-s3"
    key = "terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "bastion-terraform-test-dynamodb"
  }
}
