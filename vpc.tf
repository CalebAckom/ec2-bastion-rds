resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "bastion-test-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "bastion-test-public-subnet"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_a
  availability_zone = "eu-west-1a"

  tags = {
    Name = "bastion-test-private-subnet-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_b
  availability_zone = "eu-west-1b"

  tags = {
    Name = "bastion-test-private-subnet-b"
  }
}
