resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "bastion-test-public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "bastion-test-igw"
  }
}