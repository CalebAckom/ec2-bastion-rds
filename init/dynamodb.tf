data "aws_dynamodb_table" "existing_table" {
  name = var.dynamodb_table_name
}

# Create DynamoDB table for terraform state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "bastion-test-dynamodb"
  }

  depends_on = [data.aws_dynamodb_table.existing_table]
}