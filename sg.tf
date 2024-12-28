resource "aws_security_group" "rds_sg" {
  name = "rds-sg"
  description = "Allow EC2 instance to connect to RDS"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [format("%s/32", aws_instance.bastion.private_ip)]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-test-rds-sg"
  }
}

resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"
  description = "Allow SSH"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-test-ec2-sg"
  }
}
