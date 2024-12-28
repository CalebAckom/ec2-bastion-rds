# Create DynamoDB table for terraform state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "bastion-terraform-test-dynamodb"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "bastion-test-dynamodb"
  }
}