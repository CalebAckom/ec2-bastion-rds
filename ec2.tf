resource "aws_instance" "bastion" {
  ami = "ami-0e9085e60087ce171"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  key_name = "ci_cd"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "bastion-test-ec2"
  }
}