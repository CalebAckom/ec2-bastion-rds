resource "aws_db_instance" "database" {
  instance_class = "db.t4g.micro"
  allocated_storage = 8
  engine = "mysql"
  engine_version = "8.0"
  db_name = "test"
  username = "admin"
  manage_master_user_password = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  skip_final_snapshot = true
  identifier = "bastion-rds"

  tags = {
    Name = "bastion-test-rds"
  }
}

# Subnet Group for RDS
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  tags = {
    Name = "bastion-test-private-db-subnet-group"
  }
}