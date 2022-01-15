# Step 3. : Set up Terrform S3 state bucket..

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-state-239854"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name    = "Terraform state store"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}