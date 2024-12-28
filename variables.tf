variable "aws_region" {
  description = "AWS Region to deploy the infrastructure"
  default = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for private subnet A"
  default = "10.0.16.0/24"
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for private subnet B"
  default = "10.0.32.0/24"
}
