variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  default = "bastion-terraform-test-s3"
}

variable "dynamodb_table_name" {
  description = "DynamoDB Table Name"
  default = "bastion-terraform-test-dynamodb"
}