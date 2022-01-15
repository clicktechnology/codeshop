# Step 2. : Set up AWS Dynamo DB table..

resource "aws_dynamodb_table" "my-tf-lock" {
  name           = "my-tf-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name    = "DynamoDB Terraform State Lock Table"
    Contact = "${var.author}"
    Email = "${var.contact_mail}" }
}